import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomProgressIndicator extends StatelessWidget {
  final double ?lineWith;
  final Color? spinColor;
  final double? size;

  const CustomProgressIndicator({
    Key? key,
    this.lineWith = 3.0,
    this.spinColor,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      size: size ?? 28,
      color: spinColor ?? Theme.of(context).colorScheme.primary,
      lineWidth: lineWith ?? 3,
    );
  }
}
