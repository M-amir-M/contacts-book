import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleSpin extends StatelessWidget {
  const CircleSpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      size: 30,
      color: Colors.white,
    );
  }
}
