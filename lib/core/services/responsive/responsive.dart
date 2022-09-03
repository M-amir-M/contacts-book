import 'dart:math';

import 'package:flutter/cupertino.dart';

class Responsive {
  double? _hf; //height factor
  double? get hf => _hf;

  double? _wf; //width factor
  double? get wf => _wf;

  double? _tf; //text scale factor
  double? get tf => _tf;

  double responsiveSize(
    double size, {
    bool isWidth = true,
  }) {
    if (isWidth) {
      return size * (_wf ?? 1);
    }
    return size * (_hf ?? 1);
  }

  void setScreenScale(BuildContext context) {
    final _widthDivisor = 390.0;
    final _heightDivisor = 844.0;

    final MediaQueryData _mediaQueryData = MediaQuery.of(context);

    final _screenWidth = _mediaQueryData.size.width;
    _wf = _screenWidth / _widthDivisor;

    final _screenHeight = _mediaQueryData.size.height;
    _hf = _screenHeight / _heightDivisor;

    _tf = min(_hf!, _wf!);

    print('Screen Scaling Values:' + '_screenWidth: $_screenWidth');
    print('Screen Scaling Values:' + '_factorHorizontal: $_hf ');

    print('Screen Scaling Values:' + '_screenHeight: $_screenHeight');
    print('Screen Scaling Values:' + '_factorVertical: $_wf ');

    print('_textScalingFactor: $tf ');
  }
}
