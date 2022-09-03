import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stdev/core/data/repositories/authentication.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final AuthRepository _authRepo = locator<AuthRepository>();
  // SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();

  Future getConfiguration() async {
    await _authRepo.getUser();
    await Future.delayed(4.seconds);
    if (_authRepo.isAuthenticated) {
      await Get.offNamed(RoutePath.contactList);
    } else {
      await Get.offNamed(RoutePath.signIn);
    }
  }
}
