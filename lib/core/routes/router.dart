import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stdev/core/routes/route_path.dart';
import 'package:stdev/ui/screens/contacts/contacts.dart';
import 'package:stdev/ui/screens/signIn/signIn.dart';
import 'package:stdev/ui/screens/splash/splash.dart';


class AppRouter {
  AppRouter._();

  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.splashRoute,
      page: () => SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RoutePath.signIn,
      page: () => SignInScreen(),
      transition: Transition.cupertino,
    ),
    
    GetPage(
      name: RoutePath.contactList,
      page: () => ContactListPage(),
      transition: Transition.cupertino,
    ),
    
  ];
}
