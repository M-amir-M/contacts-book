
import 'package:shared_preferences/shared_preferences.dart';

/// helper class for store and read simple data from SharedPreferences
class SharedPreferencesHelper {
  static final String _kToken = 'token';



  Future<SharedPreferences> get _getSharedPreferences async =>
      await SharedPreferences.getInstance();


  String? _token;
  String? get token => _token;

  ///setting token to SharedPreferences
  Future<bool> setToken({required String? token}) async {
    if (token == null) {
      return false;
    }
    _token = token;
    final SharedPreferences prefs = await _getSharedPreferences;
    var result = await prefs.setString(_kToken, token);
    return result;
  }

  ///get token from SharedPreferences
  Future<String?> getToken() async {
    final SharedPreferences prefs = await _getSharedPreferences;

    String? token = prefs.getString(_kToken);

    return token;
  }

  ///remove token from SharedPreferences
  Future<bool> removeToken() async {
    final SharedPreferences prefs = await _getSharedPreferences;
    _token = null;
    final result = await prefs.remove(_kToken);

    return result;
  }

}
