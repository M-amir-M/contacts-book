import 'package:stdev/core/data/repositories/authentication.dart';
import 'package:stdev/core/data/repositories/contacts.dart';
import 'package:stdev/core/services/api/api_service.dart';
import 'package:stdev/core/services/connectivity/connectivity.dart';
import 'package:stdev/core/services/shared_preferences/shared_preferences.dart';
import 'package:stdev/core/viewmodels/auth.dart';
import 'package:stdev/core/viewmodels/contact_detail.dart';
import 'package:stdev/core/viewmodels/contacts.dart';
import 'package:stdev/core/viewmodels/new_contact.dart';
import 'package:stdev/core/viewmodels/splash.dart';
import 'package:get_it/get_it.dart';
import 'package:stdev/core/services/responsive/responsive.dart';

GetIt locator = GetIt.I;
// final sharedPreferences = SharedPreferencesHelper.getInstance();
// final apiService = ApiService.getInstance(
//   preferencesHelper: sharedPreferences,
//   logger: true,
// );

void setupLocator() {
  //services
  locator.registerLazySingleton(() => Responsive());
  locator.registerLazySingleton(() => ApiService(locator(), logger: true));
  locator.registerLazySingleton(() => SharedPreferencesHelper());
  locator.registerLazySingleton(() => ConnectivityService());
  

  //repoitories
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => ContactsRepository());


  //view models
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => ContactsViewModel());
  locator.registerFactory(() => ContactDetailViewModel());
  locator.registerFactory(() => NewContactViewModel());
  locator.registerFactory(() => AuthViewModel());
}

resetLocator() async {
  //services
  await locator.resetLazySingleton<ApiService>(
      instance: locator.get<ApiService>());
  await locator.resetLazySingleton<SharedPreferencesHelper>(
      instance: locator.get<SharedPreferencesHelper>());

}
