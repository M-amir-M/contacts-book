import 'package:flutter/material.dart';

import 'package:stdev/core/locator.dart';
import 'package:stdev/core/viewmodels/splash.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/core/services/responsive/responsive.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static Responsive _res = locator<Responsive>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) async {
        await model.getConfiguration();
      },
      builder: (context, model, index) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                
              ],
            ),
          ),
        );
      },
    );
  }

}
