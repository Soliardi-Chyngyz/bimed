import 'dart:core';

import 'package:bimed/src/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/* InputDecoration */
class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "",
        double radius = 16,
      String hintTextStr = "Введите данные",
      Widget? icon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12),
      labelText: labelTextStr,
      hintText: hintTextStr,
      hintStyle: const TextStyle(color: secondaryGray),
      labelStyle: const TextStyle(color: secondaryGray),
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: light, width: 1.0),
      ),
      prefixIcon: icon == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 5, right: 0),
              child: SizedBox(
                height: 4,
                child: icon,
              ),
            ),
    );
  }
}

/* SnackBar */
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
      content: Text(
        text,
        textAlign: TextAlign.center,
      )));
}

/* Progress Bar*/
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}
