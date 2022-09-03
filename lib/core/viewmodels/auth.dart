import 'package:get/get.dart';
import 'package:stdev/core/data/models/user.dart';
import 'package:stdev/core/data/repositories/authentication.dart';
import 'package:stdev/core/enums/network_state.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/utils/toast.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  AuthRepository _authRepository = locator<AuthRepository>();

  UserModel? get auth => _authRepository.auth;

  Future<bool> signIn(UserModel data) async {
    setState(NetworkState.BUSY);
    notifyListeners();

    await _authRepository.signIn(data);

    setState(NetworkState.COMPLETE);
    notifyListeners();

    return true;
  }
}
