import 'package:flutter/material.dart';
import 'package:stdev/ui/styles/app_theme.dart';
import 'package:stdev/ui/styles/helper.dart';

///Base is use [Container] to create a base card of application
class BaseCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final BoxShape? shape;
  final VoidCallback? onTap;

  const BaseCard({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.shape,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final cardShape = shape ?? BoxShape.rectangle;
    final cardRadius = borderRadius ??
        (cardShape == BoxShape.rectangle
            ? BorderRadius.circular(UIHelper.primaryRadius)
            : null);

    return AnimatedContainer(
      width: width,
      height: height,
      duration: Duration(milliseconds: 200),
      margin: margin ?? EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      // alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? scheme.surface,
        borderRadius: cardRadius,
        boxShadow: boxShadow ?? defaultCardBoxShadow(context),
        border: border,
        shape: cardShape,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: cardRadius,
          onTap: onTap,
          child: Padding(
            padding: padding ?? EdgeInsets.all(8),
            child: child,
          ),
        ),
      ),
    );
  }
}
