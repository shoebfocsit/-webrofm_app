import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class AudioCacheService {
  final Dio _dio;
  String? _currentEpisodeId;
  String? _cachedFilePath;

  AudioCacheService(this._dio);

  String _cacheKey(String episodeId, String url) {
    return sha256.convert(utf8.encode('$episodeId|$url')).toString();
  }

  Future<String> getLocalAudioUrl(String episodeId, String remoteUrl) async {
    if (_currentEpisodeId == episodeId && _cachedFilePath != null) {
      final file = File(_cachedFilePath!);
      if (await file.exists()) return _cachedFilePath!;
    }

    if (_currentEpisodeId != episodeId) await _clearCache();

    final dir = await getTemporaryDirectory();
    final key = _cacheKey(episodeId, remoteUrl);
    final filePath = '${dir.path}${Platform.pathSeparator}ac_$key.mp3';
    final file = File(filePath);

    if (await file.exists()) {
      _currentEpisodeId = episodeId;
      _cachedFilePath = filePath;
      return filePath;
    }

    try {
      await _dio.download(remoteUrl, filePath);
      _currentEpisodeId = episodeId;
      _cachedFilePath = filePath;
    } catch (_) {}

    return filePath;
  }

  Future<void> clearCurrentCache() async {
    await _clearCache();
  }

  Future<void> _clearCache() async {
    if (_cachedFilePath != null) {
      try {
        final file = File(_cachedFilePath!);
        if (await file.exists()) await file.delete();
      } catch (_) {}
    }
    _currentEpisodeId = null;
    _cachedFilePath = null;
  }
}
