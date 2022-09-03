import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stdev/core/constants/assets.dart';

import 'package:stdev/core/viewmodels/splash.dart';
import 'package:stdev/ui/screens/base_view.dart';
import 'package:stdev/ui/styles/helper.dart';
import 'package:stdev/ui/widgets/loading/circle/circle.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (model) async {
        await model.getConfiguration();
      },
      builder: (context, model, index) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInDown(
                    child: SvgPicture.asset(
                      Assets.logo,
                      width: 150,
                      color: Colors.white,
                    ),
                  ),
                  UIHelper.verticalSpaceXLarge,
                  CircleSpin(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
