
// import 'package:stdev/core/constants/prefrences.dart';
// import 'package:stdev/core/data/models/models.dart';
// import 'package:stdev/core/data/models/signIn_request.dart';
// import 'package:stdev/core/data/models/signUp_request.dart';
// import 'package:stdev/core/data/models/verification_request.dart';
// import 'package:stdev/core/enums/enums.dart';
// import 'package:stdev/core/locator.dart';
// import 'package:stdev/core/services/services.dart';
// import 'package:stdev/core/utils/utils.dart';

// class AuthRepository {
//   ApiService _api = locator<ApiService>();
//   SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();
//   UserSettingServices _userSettingServices = locator<UserSettingServices>();

//   UserModel? _auth;
//   UserModel? get auth => _auth;
//   set setAuth(UserModel auth) {
//     _auth = auth;
//   }

//   String? _username;
//   String? get username => _username;

//   String? _token;
//   String? get token => _token;

//   String marketType = marketTypes.reverse?[Preferences.marketType] ?? 'NO';

//   bool get isAuthenticated => _token?.isNotEmpty ?? false;

//   AuthState? _authState;
//   AuthState? get authState => _authState;

//   Future<Result> signIn(SignInRequestModel data) async {
//     var result = await _api.signIn(data);

//     if (result.success) {
//       _auth = UserModel.fromJson(result.data["user"]);
//       _token = result.data["access_token"];
//       await _sp.setToken(token: _token);
//       await resetLocator();
//       await _userSettingServices.updateLocale(LocaleModel(code: _auth?.locale));
//     }
//     return result;
//   }

//   Future<Result> signUp(SignUpRequestModel data) async {
//     var result = await _api.signUp(data);

//     if (result.success) {
//       _username = data.phone;
//     }
//     return result;
//   }

//   Future<Result> verification(VerificationRequestModel data) async {
//     var result = await _api.verification(data);

//     if (result.success) {
//       String token = result.data["access_token"];
//       _auth = UserModel.fromJson(result.data['user']);

//       await _sp.setToken(token: token);
//       await _userSettingServices.updateLocale(LocaleModel(code: _auth?.locale));
//       resetLocator();
//     }
//     return result;
//   }

//   Future signOut() async {
//     _auth = null;
//     _token = null;

//     await _sp.removeSettings();
//     await _sp.removeToken();
//     await resetLocator();
//   }

//   Future<Result> getUser() async {
//     final Result result = await _api.getAuth();
//     if (result.success) {
//       _auth = UserModel.fromJson(result.data);
//       await _userSettingServices.updateLocale(LocaleModel(code: _auth?.locale));
//       resetApiLocator();

//       // await _sp.removeToken();
//       await _sp.setToken(token: "$token");
//       // _sp.setUser(auth);
//     }
//     return result;
//   }

//   Future<Result> setInviter(String code) async {
//     final Result result = await _api.setInviter(code);
//     if (result.success) {
//       ToastUtil.showSuccessToast(message: result.message ?? "successful");
//     } else {
//       ToastUtil.showErrorToast(message: result.parseAllErrors().message);
//     }
//     return result;
//   }

//   Future getToken() async {
//     _token = await _sp.getToken();
//   }
// }
