import 'package:ivy/api/base/base_exception.dart';
import 'package:ivy/app.dart';

class ServerException extends BaseException {
  ServerException([int? code, String? message])
      : super(code,
            "${GlobalMaterialkey.contextKey.currentContext} : $message");
}
