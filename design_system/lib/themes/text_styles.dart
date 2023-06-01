import 'package:design_system/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const button = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static const labelField = TextStyle(
    fontSize: 15,
    color: AppColors.grey1,
    fontWeight: FontWeight.w300,
  );

  static const heading1 = TextStyle(
    fontSize: 26,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const subtitle1 = TextStyle(
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}