import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/core/viewmodels/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  // final AuthRepository _authRepo = locator<AuthRepository>();
  // SharedPreferencesHelper _sp = locator<SharedPreferencesHelper>();

  Future getConfiguration() async {
    // await _authRepo.getToken();
    await Future.delayed(5.seconds);

    await Get.offNamed(RoutePath.contactList);
  }
}
