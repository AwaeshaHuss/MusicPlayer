import 'package:http/http.dart' as http;
import 'package:music_player/utils/base/base_utils_export.dart';

class CustomHttpMethods {
  CustomHttpMethods._();
  static final Map<String, String> _headers = {};

  static Future<http.Response> makeRequest<T>(String endPoint,
      {required String method,
      Map<String, String>? headers,
      dynamic requestBody = const {}}) async {
    late http.Response response;

    try {
      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(
              Uri.parse('${MusicConsts.baseUrl}$endPoint'),
              headers: headers ?? _headers);
          break;
        case 'POST':
          response = await http.post(
              Uri.parse('${MusicConsts.baseUrl}$endPoint'),
              headers: headers ?? _headers,
              body: requestBody);
          break;
        case 'PUT':
          response = await http.put(
              Uri.parse('${MusicConsts.baseUrl}$endPoint'),
              headers: headers ?? _headers,
              body: requestBody);
          break;
        case 'PATCH':
          response = await http.patch(
              Uri.parse('${MusicConsts.baseUrl}$endPoint'),
              headers: headers ?? _headers,
              body: requestBody);
          break;
        case 'DELETE':
          response = await http.delete(
              Uri.parse('${MusicConsts.baseUrl}$endPoint'),
              headers: headers ?? _headers);
          break;
        default:
          throw Exception('Invalid HTTP method: $method');
      }
    } on Exception catch (error) {
      error is http.ClientException ? throw Exception('''\n
Error during HTTP request on: ${error.uri?.path} with status code: ${error.message}
\n''') : throw Exception('Some thing went wrong, on http request: $error');
    }

    return response;
  }
}