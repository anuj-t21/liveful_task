import 'package:flutter/material.dart';
import 'package:liveful_task/core/constants/app_colors.dart';
import 'package:liveful_task/core/utils/screen_util/screen_util.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle clashDisplay = const TextStyle(
    fontFamily: 'Clash Display',
  );
}

extension TextStyleExtension on TextStyle {
  TextStyle get w4 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w5 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w6 => copyWith(fontWeight: FontWeight.w600);

  TextStyle get s6 => copyWith(fontSize: 6.sp);
  TextStyle get s8 => copyWith(fontSize: 8.sp);
  TextStyle get s10 => copyWith(fontSize: 10.sp);
  TextStyle get s12 => copyWith(fontSize: 12.sp);
  TextStyle get s14 => copyWith(fontSize: 14.sp);
  TextStyle get s16 => copyWith(fontSize: 16.sp);
  TextStyle get s18 => copyWith(fontSize: 18.sp);
  TextStyle get s20 => copyWith(fontSize: 20.sp);
  TextStyle get s22 => copyWith(fontSize: 22.sp);
  TextStyle get s24 => copyWith(fontSize: 24.sp);

  TextStyle get pureWhite => copyWith(color: AppColors.pureWhite);
  TextStyle get pureBlack => copyWith(color: AppColors.pureBlack);
}
