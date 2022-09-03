import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'core/i18n/tr.dart';
import 'package:stdev/core/services/responsive/responsive.dart';
import 'core/routes/route_path.dart';
import 'core/routes/router.dart';
import 'core/locator.dart';
import 'ui/styles/app_theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  
  return runApp(
    MaterialApp(
      home: AppConfiguration(),
      debugShowCheckedModeBanner: false,
    ),
  );
}


class AppConfiguration extends StatefulWidget {
  @override
  _AppConfigurationState createState() => _AppConfigurationState();
}

class _AppConfigurationState extends State<AppConfiguration> {
  final Responsive _responsive = locator<Responsive>();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _responsive.setScreenScale(context);

    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isEn = true;

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);

    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {}

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ST Dev',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
      ],
      translations: AppTranslation(),
      locale: Locale("en", "US"),
      navigatorKey: Get.key,
      theme: AppThemeData.lightThemeData(),
      initialRoute: RoutePath.splashRoute,
      getPages: AppRouter.pages,
      navigatorObservers: [
        routeObserver,
      ],
    );
  }
}
