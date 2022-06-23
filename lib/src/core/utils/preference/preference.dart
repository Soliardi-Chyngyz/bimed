import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs._privateConstructor();

  static final Prefs _instance = Prefs._privateConstructor();

  static const _token = 'token';
  static const _userName = 'userName';
  static const _userPhone = 'userPhone';
  static const _countryCode = '_countryCode';
  static const _productType = '_productType';
  static const _deviceToken = 'deviceToken';

  factory Prefs() {
    return _instance;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _setString(String key, String saveValue) async {
    final prefs = await _prefs;
    prefs.setString(key, saveValue);
  }

  Future<String?> _getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> _removePref(String key) async {
    final prefs = await _prefs;
    prefs.remove(key);
  }

  void setToken(String token) => _setString(_token, token);

  void setProductType(String? userType) {
    if (userType == null) return;

    switch (userType) {
      case 'Розница':
        userType = 'retail';
        break;
      case 'Пенсионер':
        userType = 'pensioner';
        break;
      case 'Постоянный покупатель':
        userType = 'client';
        break;
      case 'Оптовик':
        userType = 'wholesaler';
        break;
      case '1С пользователь':
        userType = '1с';
    }
    _setString(_productType, userType);
  }

  void deleteToken() => _removePref(_token);

  Future<String> getProductType() async {
    var userType = await _getString(_productType);
    userType ??= 'retail';
    return userType;
  }

  Future<String?> getToken() async {
    return await _getString(_token);
  }

  Future<bool> isAuthorized() async {
    return await getToken() != null;
  }
}
