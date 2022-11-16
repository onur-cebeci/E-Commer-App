import 'package:flutter/material.dart';

SnackBar customSnackBar(
    {required Widget widget, required Color color, required double size}) {
  return SnackBar(
    // margin: EdgeInsets.only(bottom: size.height - size.height / 5),
    margin: EdgeInsets.only(bottom: size),
    behavior: SnackBarBehavior.floating,
    content: widget,
    backgroundColor: color,
  );
}
/*
Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline3!.copyWith(
          color: kSecondColor, fontSize: 17, fontWeight: FontWeight.bold),
    ),
 */
