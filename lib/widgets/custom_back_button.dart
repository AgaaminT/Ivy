import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customBackButtonWidget(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 8.h),
    child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 18.h
        )),
  );
}
