
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ivy/utils/app_colors.dart';

Widget customTextWidget(
  String text, {
  double? fontSize,
  double? wordSpacing,
  double? letterSpacing,
  int? maxLines,
  TextOverflow? overflow,
  TextAlign? textAlign,
  FontWeight fontWeight = FontWeight.normal,
  Color color = AppColors.ternaryColor,
}) {
  final defaultFontSize = ScreenUtil().setHeight(12.h);
  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    style: GoogleFonts.rubik(
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
