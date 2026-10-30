import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:webrofm/core/database/encryption_service.dart';
import 'package:webrofm/features/home/data/models/category_dto.dart';
import 'package:webrofm/features/home/data/models/language_dto.dart';
import 'package:webrofm/features/home/data/models/show_dto.dart';
import 'package:webrofm/features/home/domain/entities/preload_data.dart';

class LocalDatabase {
  static Database? _database;
  final EncryptionService _encryptionService;
  PreloadData? _preloadCache;

  LocalDatabase(this._encryptionService);

  Future<Database> get database async {
    if (_database != null) return _database!;
    await _encryptionService.ensureInitialized();
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = '${dbPath}webrofm_encrypted.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS shows (
            id TEXT PRIMARY KEY,
            data TEXT NOT NULL,
            checksum TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS episodes (
            id TEXT PRIMARY KEY,
            show_id TEXT NOT NULL,
            data TEXT NOT NULL,
            checksum TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS categories (
            id TEXT PRIMARY KEY,
            data TEXT NOT NULL,
            checksum TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS languages (
            id TEXT PRIMARY KEY,
            data TEXT NOT NULL,
            checksum TEXT NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS sync_metadata (
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL
          )
        ''');
      },
    );
  }

  String _computeChecksum(String jsonStr) {
    return sha256.convert(utf8.encode(jsonStr)).toString();
  }

  String _encrypt(String plaintext) => _encryptionService.encrypt(plaintext);
  String _decrypt(String ciphertext) => _encryptionService.decrypt(ciphertext);

  // ── Shows ──

  Future<void> upsertShow(String id, Map<String, dynamic> json) async {
    final db = await database;
    final jsonStr = jsonEncode(json);
    final encrypted = _encrypt(jsonStr);
    final checksum = _computeChecksum(jsonStr);
    final now = DateTime.now().toIso8601String();
    await db.insert(
      'shows',
      {'id': id, 'data': encrypted, 'checksum': checksum, 'updated_at': now},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getShowById(String id) async {
    final db = await database;
    final rows = await db.query('shows', where: 'id = ?', whereArgs: [id]);
    if (rows.isEmpty) return null;
    return jsonDecode(_decrypt(rows.first['data'] as String)) as Map<String, dynamic>;
  }

  Future<List<Map<String, dynamic>>> getAllShows() async {
    final db = await database;
    final rows = await db.query('shows', orderBy: 'updated_at DESC');
    return rows.map((r) => jsonDecode(_decrypt(r['data'] as String)) as Map<String, dynamic>).toList();
  }

  Future<void> deleteShow(String id) async {
    final db = await database;
    await db.delete('shows', where: 'id = ?', whereArgs: [id]);
  }

  // ── Episodes ──

  Future<void> upsertEpisode(String id, String showId, Map<String, dynamic> json) async {
    final db = await database;
    final jsonStr = jsonEncode(json);
    final encrypted = _encrypt(jsonStr);
    final checksum = _computeChecksum(jsonStr);
    final now = DateTime.now().toIso8601String();
    await db.insert(
      'episodes',
      {
        'id': id,
        'show_id': showId,
        'data': encrypted,
        'checksum': checksum,
        'updated_at': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getEpisodesForShow(String showId) async {
    final db = await database;
    final rows = await db.query(
      'episodes',
      where: 'show_id = ?',
      whereArgs: [showId],
      orderBy: 'updated_at ASC',
    );
    return rows.map((r) => jsonDecode(_decrypt(r['data'] as String)) as Map<String, dynamic>).toList();
  }

  Future<void> deleteEpisodesForShow(String showId) async {
    final db = await database;
    await db.delete('episodes', where: 'show_id = ?', whereArgs: [showId]);
  }

  // ── Categories ──

  Future<void> upsertCategory(String id, Map<String, dynamic> json) async {
    final db = await database;
    final jsonStr = jsonEncode(json);
    final encrypted = _encrypt(jsonStr);
    final checksum = _computeChecksum(jsonStr);
    final now = DateTime.now().toIso8601String();
    await db.insert(
      'categories',
      {'id': id, 'data': encrypted, 'checksum': checksum, 'updated_at': now},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final db = await database;
    final rows = await db.query('categories', orderBy: 'updated_at DESC');
    return rows.map((r) => jsonDecode(_decrypt(r['data'] as String)) as Map<String, dynamic>).toList();
  }

  // ── Languages ──

  Future<void> upsertLanguage(String id, Map<String, dynamic> json) async {
    final db = await database;
    final jsonStr = jsonEncode(json);
    final encrypted = _encrypt(jsonStr);
    final checksum = _computeChecksum(jsonStr);
    final now = DateTime.now().toIso8601String();
    await db.insert(
      'languages',
      {'id': id, 'data': encrypted, 'checksum': checksum, 'updated_at': now},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllLanguages() async {
    final db = await database;
    final rows = await db.query('languages', orderBy: 'updated_at DESC');
    return rows.map((r) => jsonDecode(_decrypt(r['data'] as String)) as Map<String, dynamic>).toList();
  }

  // ── Sync Metadata ──

  Future<String?> getSyncMetadata(String key) async {
    final db = await database;
    final rows = await db.query('sync_metadata', where: 'key = ?', whereArgs: [key]);
    if (rows.isEmpty) return null;
    return rows.first['value'] as String?;
  }

  Future<void> setSyncMetadata(String key, String value) async {
    final db = await database;
    await db.insert(
      'sync_metadata',
      {'key': key, 'value': value},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ── Bulk Delete ──

  Future<void> deleteShowsNotIn(Set<String> ids) async {
    if (ids.isEmpty) {
      await clearAll();
      return;
    }
    final db = await database;
    final ph = ids.map((_) => '?').join(',');
    await db.delete('shows', where: 'id NOT IN ($ph)', whereArgs: ids.toList());
    await db.delete('episodes', where: 'show_id NOT IN ($ph)', whereArgs: ids.toList());
  }

  Future<void> deleteCategoriesNotIn(Set<String> ids) async {
    if (ids.isEmpty) return;
    final db = await database;
    final ph = ids.map((_) => '?').join(',');
    await db.delete('categories', where: 'id NOT IN ($ph)', whereArgs: ids.toList());
  }

  Future<void> deleteLanguagesNotIn(Set<String> ids) async {
    if (ids.isEmpty) return;
    final db = await database;
    final ph = ids.map((_) => '?').join(',');
    await db.delete('languages', where: 'id NOT IN ($ph)', whereArgs: ids.toList());
  }

  Future<void> clearAll() async {
    _preloadCache = null;
    final db = await database;
    await db.delete('shows');
    await db.delete('episodes');
    await db.delete('categories');
    await db.delete('languages');
  }

  // ── High-level sync: store entire PreloadDataDTO ──

  Future<void> syncPreload({
    required List<ShowDTO> shows,
    required List<ShowCategoryDTO> categories,
    required List<LanguageDTO> languages,
  }) async {
    final apiShowIds = shows.map((s) => s.id).toSet();
    final apiCategoryIds = categories.map((c) => c.id.toString()).toSet();
    final apiLanguageIds = languages.map((l) => l.id.toString()).toSet();

    await deleteShowsNotIn(apiShowIds);
    await deleteCategoriesNotIn(apiCategoryIds);
    await deleteLanguagesNotIn(apiLanguageIds);
    await (await database).delete('episodes');

    for (final showDto in shows) {
      final showJson = showDto.toJson();
      await upsertShow(showDto.id, showJson);
    }

    for (final catDto in categories) {
      await upsertCategory(catDto.id.toString(), catDto.toJson());
    }

    for (final langDto in languages) {
      await upsertLanguage(langDto.id.toString(), langDto.toJson());
    }

    await setSyncMetadata('last_synced_at', DateTime.now().toIso8601String());
    _preloadCache = PreloadData(
      shows: shows.map((s) => s.toDomain()).toList(),
      categories: categories.map((c) => c.toDomain()).toList(),
      languages: languages.map((l) => l.toDomain()).toList(),
      teasers: [],
    );
  }

  // ── Read back as domain objects ──

  Future<PreloadData> getAllCachedPreloadData() async {
    if (_preloadCache != null) return _preloadCache!;
    final showMaps = await getAllShows();
    final categoryMaps = await getAllCategories();
    final languageMaps = await getAllLanguages();

    final shows = showMaps
        .map((m) => ShowDTO.fromJson(m, includeEpisodes: false).toDomain())
        .toList();
    final categories = categoryMaps.map((m) => ShowCategoryDTO.fromJson(m).toDomain()).toList();
    final languages = languageMaps.map((m) => LanguageDTO.fromJson(m).toDomain()).toList();

    _preloadCache = PreloadData(
      shows: shows,
      categories: categories,
      languages: languages,
      teasers: [],
    );
    return _preloadCache!;
  }

  void invalidateCache() {
    _preloadCache = null;
  }
}
