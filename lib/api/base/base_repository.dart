// // ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison

// import 'dart:async';
// import 'dart:convert';

// import 'dart:io';

// import 'package:async/async.dart';

// import 'package:http/http.dart' as http;
// import 'package:http_interceptor/http/intercepted_client.dart';
// import 'package:ivy/api/exceptions/exceptions.dart';
// import 'package:ivy/api/exceptions/network_exceptions.dart';
// import 'package:ivy/api/base/header_interceptor.dart';
// import 'package:ivy/api/base/logging_interceptor.dart';
// import 'package:ivy/api/base/url_query_parameters.dart';
// import 'package:ivy/res/components/api_constants.dart';

// import 'package:path/path.dart';

// enum RequestType { GET, POST, PUT, DELETE, PATCH }

// class BaseRepository {
//   late InterceptedClient httpClient;
//   BaseRepository() {
//     httpClient = InterceptedClient.build(interceptors: [
//       HeaderInterceptor(),
//       LoggingInterceptor(),
//     ], requestTimeout: Duration(seconds: 30));
//   }

//   Future<http.Response> requestHttps(
//       RequestType type, String endpoint, dynamic request,
//       {String baseURL = ApiConstants.baseUrl,
//       Map<String, String> queryParameters = const {},
//       Map<String, String> headers = const {}}) async {
//     String uri = baseURL + endpoint + getQueryParameters(queryParameters);
//     Uri validUri = Uri.parse(uri);
//     http.Response response;
//     switch (type) {
//       case RequestType.GET:
//         response = await httpClient.get(validUri, headers: headers);
//         break;
//       case RequestType.POST:
//         response =
//             await httpClient.post(validUri, headers: headers, body: request);
//         break;
//       case RequestType.PUT:
//         response =
//             await httpClient.put(validUri, headers: headers, body: request);
//         break;
//       case RequestType.PATCH:
//         response =
//             await httpClient.patch(validUri, headers: headers, body: request);
//         break;
//       case RequestType.DELETE:
//         response = await httpClient.delete(validUri, headers: headers);
//         break;
//     }
//     if (response.statusCode != 200) {
//       defaultHandleResponse(request, response);
//       print("Failed request");
//     }
//     return response;
//   }

//   Future<http.Response> sendFile(
//       String baseURL,
//       String method,
//       Map<String, String> queryParameters,
//       Map<String, String> headers,
//       File file) async {
//     try {
//       var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
//       var length = await file.length();
//       String uri = baseURL + method + getQueryParameters(queryParameters);
//       Uri validUri = Uri.parse(uri);
//       var request = new http.MultipartRequest("POST", validUri);
//       var multipartFileSign = new http.MultipartFile('photo', stream, length,
//           filename: basename(file.path));
//       request.files.add(multipartFileSign);
//       request.headers.addAll(headers);
//       return await http.Response.fromStream(await request.send());
//     } on SocketException {
//       throw NetworkException();
//     } on TimeoutException {
//       throw CustomTimeoutException();
//     }
//   }

//   defaultHandleResponse(dynamic request, http.Response response) {
//     if (response.statusCode >= 500) {
//       throw ServerErrorException(response.body.toString());
//     }
//     switch (response.statusCode) {
//       case 400:
//         throw MissRequestParamsException(
//             getRequestJson(request), getResponseJson(response));
//       case 404:
//         throw NotFoundException();
//       case 421:
//         throw ExternalServicesFailException();
//       case 401:
//       case 403:
//         throw TokenExpiredException();
//     }
//   }

//   String getRequestJson(dynamic request) {
//     return request != null ? json.encode(request) : "Empty";
//   }

//   String getResponseJson(http.Response response) {
//     return response.body.toString();
//   }

//   String getQueryParameters(Map<String, String> queryParameters) {
//     if (queryParameters != null && queryParameters.isNotEmpty) {
//       URLQueryParams queryParams = new URLQueryParams();
//       queryParameters.forEach((key, value) {
//         queryParams.append(key, value);
//       });
//       return "?${queryParams.toString()}";
//     }
//     return "";
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

enum RequestType { GET, POST, PUT, DELETE, PATCH }

class BaseRepository {
  static const int timeoutDuration = 30; // Timeout after 30 seconds

  // A general method to make API requests
  Future<Map<String, dynamic>> request({
    required String url,
    RequestType type = RequestType.GET,
    Map<String, dynamic>? body,
  }) async {
    http.Response response;

    // For debugging/logging
    print("Making request to URL: $url");
    if (body != null) {
      print("Request body: ${jsonEncode(body)}");
    }

    try {
      switch (type) {
        case RequestType.GET:
          response = await http.get(Uri.parse(url)).timeout(Duration(seconds: timeoutDuration));
          break;
        case RequestType.POST:
          response = await http
              .post(
                Uri.parse(url),
                body: jsonEncode(body),
                headers: {"Content-Type": "application/json"},
              )
              .timeout(Duration(seconds: timeoutDuration));
          break;
        case RequestType.PUT:
          response = await http
              .put(
                Uri.parse(url),
                body: jsonEncode(body),
                headers: {"Content-Type": "application/json"},
              )
              .timeout(Duration(seconds: timeoutDuration));
          break;
        case RequestType.DELETE:
          response = await http.delete(Uri.parse(url)).timeout(Duration(seconds: timeoutDuration));
          break;
        case RequestType.PATCH:
          response = await http
              .patch(
                Uri.parse(url),
                body: jsonEncode(body),
                headers: {"Content-Type": "application/json"},
              )
              .timeout(Duration(seconds: timeoutDuration));
          break;
        default:
          throw Exception('Request type not supported');
      }

      // Handle different status codes
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Successful response
        return jsonDecode(response.body);
      } else {
        // Error response
        throw Exception('Error ${response.statusCode}: ${response.body}');
      }
    } on http.ClientException catch (e) {
      print("Client error: $e");
      throw Exception('Failed to make request. Client error: $e');
    } on TimeoutException catch (_) {
      print("Request timed out");
      throw Exception('Request to $url timed out.');
    } catch (e) {
      print("Unhandled error: $e");
      throw Exception('Failed to make request: $e');
    }
  }
}
