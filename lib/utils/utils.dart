import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.blueGrey,
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(message, BuildContext context,
      {required Text content}) {
    print('Flushbar called with message: $message');
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          message: message,
          icon: const Icon(Icons.error, size: 20, color: Colors.white),
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('message'),
    ));
  }
}
