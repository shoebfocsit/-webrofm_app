import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webrofm/core/constants/app_constants.dart';
import 'package:webrofm/features/auth/data/models/user_dto.dart';

class AuthLocalSource {
  final FlutterSecureStorage _secureStorage;
  final GetStorage _getStorage;

  AuthLocalSource(this._secureStorage, this._getStorage);

  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: AppConstants.prefToken, value: token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: AppConstants.prefToken);
  }

  Future<void> deleteToken() async {
    await _secureStorage.delete(key: AppConstants.prefToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(key: AppConstants.prefRefreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: AppConstants.prefRefreshToken);
  }

  Future<void> deleteRefreshToken() async {
    await _secureStorage.delete(key: AppConstants.prefRefreshToken);
  }

  Future<void> saveUser(UserDTO user) async {
    await _getStorage.write(AppConstants.prefUserData, user.toJson());
  }

  UserDTO? getUser() {
    final data = _getStorage.read<Map<String, dynamic>>(
      AppConstants.prefUserData,
    );
    if (data != null) {
      return UserDTO.fromJson(data);
    }
    return null;
  }

  Future<void> deleteUser() async {
    await _getStorage.remove(AppConstants.prefUserData);
  }

  Future<void> setLoggedIn(bool value) async {
    await _getStorage.write(AppConstants.prefIsLoggedIn, value);
  }

  bool isLoggedIn() {
    return _getStorage.read<bool>(AppConstants.prefIsLoggedIn) ?? false;
  }

  Future<void> clearAll() async {
    await deleteToken();
    await deleteRefreshToken();
    await deleteUser();
    await _getStorage.remove(AppConstants.prefIsLoggedIn);
    await _getStorage.remove(AppConstants.prefContinuePlay);
    await _getStorage.remove(AppConstants.prefFavorites);
    await _getStorage.remove(AppConstants.prefRecentSearches);
  }
}
