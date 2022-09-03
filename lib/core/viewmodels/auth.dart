import 'package:get/get.dart';
import 'package:stdev/core/enums/network_state.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  // AuthRepository _authRepository = locator<AuthRepository>();
  
  // UserModel? get auth => _authRepository.auth;
  
  // Future<bool> signIn(var data) async {
  //   setState(NetworkState.BUSY);
  //   notifyListeners();

  //   var result = await _authRepository.signIn(data);

  //   if (result.success) {
  //     setState(NetworkState.COMPLETE);
  //     notifyListeners();

  //     return true;
  //   } else {
  //     ToastUtil.showErrorToast(message: result.parseAllErrors().message);
  //     setState(NetworkState.ERROR);
  //     notifyListeners();

  //     return false;
  //   }
  // }

}
