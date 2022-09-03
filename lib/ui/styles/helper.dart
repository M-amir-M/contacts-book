import 'package:flutter/material.dart';
import 'package:stdev/core/locator.dart';
import 'package:stdev/core/services/responsive/responsive.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  static Responsive _res = locator<Responsive>();
  // Vertical spacing for AppBar.
  static double _VerticalSpaceAppBar = _res.responsiveSize(64);

  static Widget verticalSpaceAppBar = SizedBox(height: _VerticalSpaceAppBar);

  // Horizontal padding
  static double paddingXLarge = 32;
  static double paddingLarge = 16;
  static double paddingMedium = 8;
  static double paddingSmall = 4;
  static double paddingXSmall = 2;

  // Radius
  static double primaryRadius = 8;
  static double secondrayRadius = 16;

  // Vertical spacing constants. Adjust to your liking.
  static double _VerticalSpaceXSmall = _res.responsiveSize(2);
  static double _VerticalSpaceSmall = _res.responsiveSize(4);
  static double _VerticalSpaceMedium = _res.responsiveSize(8);
  static double _VerticalSpaceLarge = _res.responsiveSize(16);
  static double _VerticalSpaceXLarge = _res.responsiveSize(32);

  // Vertical spacing constants. Adjust to your liking.
  static double _HorizontalSpaceXSmall = _res.responsiveSize(2);
  static double _HorizontalSpaceSmall = _res.responsiveSize(4);
  static double _HorizontalSpaceMedium = _res.responsiveSize(8);
  static double _HorizontalSpaceLarge = _res.responsiveSize(16);

  static Widget verticalSpaceXSmall = SizedBox(height: _VerticalSpaceXSmall);
  static Widget verticalSpaceSmall = SizedBox(height: _VerticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _VerticalSpaceMedium);
  static Widget verticalSpaceLarge = SizedBox(height: _VerticalSpaceLarge);
  static Widget verticalSpaceXLarge = SizedBox(height: _VerticalSpaceXLarge);

  static Widget horizontalSpaceXSmall = SizedBox(width: _HorizontalSpaceXSmall);
  static Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall);
  static Widget horizontalSpaceMedium = SizedBox(width: _HorizontalSpaceMedium);
  static Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge);

}
