// ignore: file_names
abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostAPiResponse(String url, dynamic data);
}
