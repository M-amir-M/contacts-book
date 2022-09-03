import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stdev/ui/styles/app_sizes.dart';
import 'package:stdev/ui/styles/app_theme.dart';

class ToastUtil {
  ToastUtil._();

  static Duration duration = const Duration(seconds: 50);
  static Duration animationDuration = const Duration(milliseconds: 500);

  static void showSuccessToast({
    required String message,
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        style: AppThemeData.themeData().textTheme.subtitle2?.copyWith(
              color: Colors.white,
            ),
      ),
      icon: icon ?? Icon(Iconsax.tick_square, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          AppThemeData.themeData().colorScheme.primary.withOpacity(.6),
          AppThemeData.themeData().colorScheme.primary,
        ],
      ),
    );
  }

  static void showInformationToast({
    required String message,
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        style: AppThemeData.themeData().textTheme.subtitle2?.copyWith(
              color: Colors.white,
            ),
      ),
      icon: icon ?? Icon(Iconsax.danger, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          AppThemeData.themeData().colorScheme.surfaceVariant.withOpacity(.6),
          AppThemeData.themeData().colorScheme.surfaceVariant,
        ],
      ),
    );
  }

  static void showErrorToast({
    String message = 'خطای رخ داد',
    Widget? icon,
    Duration? duration,
  }) {
    Get.rawSnackbar(
      animationDuration: animationDuration,
      duration: duration ?? 5.seconds,
      borderRadius: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        message,
        style: AppThemeData.themeData().textTheme.subtitle2?.copyWith(
              color: Colors.white,
            ),
      ),
      icon: icon ?? Icon(Iconsax.danger, size: 25, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundGradient: LinearGradient(
        colors: [
          AppThemeData.themeData().colorScheme.error.withOpacity(.6),
          AppThemeData.themeData().colorScheme.error,
        ],
      ),
    );
  }

  static void showCustomToast() {}
}

class Iconsa {
}
