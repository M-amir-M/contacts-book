import 'package:flutter/material.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/services/responsive/responsive.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class SizeHelper {
  static Responsive _res = locator<Responsive>();

  static double screenWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double res(double size) {
    return _res.responsiveSize(size);
  }
}
