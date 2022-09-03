import 'package:stdev/core/constants/prefrences.dart';
import 'package:stdev/core/data/models/result/result.dart';
import 'package:stdev/core/data/models/user.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/services/api/api_service.dart';
import 'package:stdev/core/services/shared_preferences/shared_preferences.dart';

class AuthRepository {
  ApiService _api = locator<ApiService>();
  SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();

  UserModel? _auth;
  UserModel? get auth => _auth;
  set setAuth(UserModel auth) {
    _auth = auth;
  }

  bool get isAuthenticated => _auth != null;

  Future signIn(UserModel user) async {
    _auth = user;
    _sp.setAuth(user: user);
  }

  Future signOut() async {
    await _sp.removeAuth();
  }

  Future getUser() async {
    _auth = await _sp.getAuth();
  }

}
