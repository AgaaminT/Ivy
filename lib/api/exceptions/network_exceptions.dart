import 'package:flutter/src/widgets/framework.dart';
import 'package:ivy/api/base/base_exception.dart';
import 'package:ivy/app.dart';



class NetworkException extends BaseException {
  NetworkException()
      : super(null,
            "${GlobalMaterialkey.contextKey.currentContext?.translate(TranslationConstants.noInternetConnectionFound)}\n${GlobalMaterialkey.contextKey.currentContext?.translate(TranslationConstants.checkYourConnectionAndTryAgain)}");
}

extension on BuildContext? {
  translate(noInternetConnectionFound) {}
}

class TranslationConstants {
  static var noInternetConnectionFound;
  
  static var checkYourConnectionAndTryAgain;
}
