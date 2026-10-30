import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static const _keyKey = 'webrofm_enc_key';
  final FlutterSecureStorage _secureStorage;
  Key? _key;
  IV? _iv;

  EncryptionService(this._secureStorage);

  Future<void> ensureInitialized() async {
    if (_key != null) return;
    final stored = await _secureStorage.read(key: _keyKey);
    if (stored != null) {
      final parts = stored.split(':');
      if (parts.length == 2) {
        _key = Key.fromBase64(parts[0]);
        _iv = IV.fromBase64(parts[1]);
        return;
      }
    }
    _key = Key.fromLength(32);
    _iv = IV.fromLength(16);
    await _secureStorage.write(
      key: _keyKey,
      value: '${_key!.base64}:${_iv!.base64}',
    );
  }

  String encrypt(String plainText) {
    final encrypter = Encrypter(AES(_key!, mode: AESMode.cbc));
    return encrypter.encrypt(plainText, iv: _iv!).base64;
  }

  String decrypt(String cipherText) {
    final encrypter = Encrypter(AES(_key!, mode: AESMode.cbc));
    return encrypter.decrypt64(cipherText, iv: _iv!);
  }
}
