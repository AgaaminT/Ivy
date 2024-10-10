import 'package:ivy/api/base/base_exception.dart';

import 'package:ivy/app.dart';

class MissRequestParamsException extends BaseException {
  MissRequestParamsException(String request, String response)
      : super(400, GlobalMaterialkey.contextKey.currentContext as String?,
            request: request, response: response);
}

class InvalidTokenException extends BaseException {
  InvalidTokenException()
      : super(401, GlobalMaterialkey.contextKey.currentContext as String?);
}

class NotFoundException extends BaseException {
  NotFoundException()
      : super(404, GlobalMaterialkey.contextKey.currentContext as String?);
}

class LoginFailedException extends BaseException {
  LoginFailedException()
      : super(
            401,
            GlobalMaterialkey.contextKey.currentContext as String?);
}

class TokenExpiredException extends BaseException {
  TokenExpiredException()
      : super(401, GlobalMaterialkey.contextKey.currentContext as String?);
}

class CustomTimeoutException extends BaseException {
  CustomTimeoutException()
      : super(null, GlobalMaterialkey.contextKey.currentContext as String?);
}

class ExternalServicesFailException extends BaseException {
  ExternalServicesFailException()
      : super(
            421,
            GlobalMaterialkey.contextKey.currentContext as String?);
}

class ParseErrorException extends BaseException {
  String error;

  ParseErrorException(this.error)
      : super(null, GlobalMaterialkey.contextKey.currentContext as String?);
}

class ServerErrorException extends BaseException {
  String error;

  ServerErrorException(this.error)
      : super(null, GlobalMaterialkey.contextKey.currentContext as String?);
  @override
  String toString() {
    return "${GlobalMaterialkey.contextKey.currentContext}";
  }
}
