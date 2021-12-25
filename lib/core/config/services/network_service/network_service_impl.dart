import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/core/constants/string_constant.dart';
import 'network_service_abstract.dart';

class NetworkServiceImpl implements NetworkService {
  @override
  Future<String> getToken() async {
    String _token = await StorageService().getString(key: TOKEN);
    return _token ?? '';
  }

  @override
  Future<Map<String, String>> getRequestHeaders({bool isNotAuthenticated}) async {
    Map<String, String> headers = <String, String>{};
    headers['Content-Type'] = 'application/json';
    // TODO: Add other headers parameters here
    if (!isNotAuthenticated) {
      var token = await getToken();
      print(token);
      
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  @override
  Future<http.Response> deleteHttpResponse({Uri uri, Object body}) async {
    http.Response res;
    res = await http
        .delete(
          uri,
          headers: await getRequestHeaders(),
          body: jsonEncode(body),
        )
        .timeout(Duration(seconds: 45));
    return res;
  }

  @override
  Future<http.Response> getHttpResponse({Uri uri}) async {
    http.Response res;
    res = await http
        .get(uri, headers: await getRequestHeaders(isNotAuthenticated: false))
        .timeout(Duration(seconds: 45));
    return res;
  }

  @override
  Future<http.Response> patchHttpResponse({Uri uri, Object body}) async {
    http.Response res;
    res = await http
        .patch(
          uri,
          headers: await getRequestHeaders(),
          body: jsonEncode(body),
        )
        .timeout(Duration(seconds: 45));
    return res;
  }

  @override
  Future<http.Response> postHttpResponse({Uri uri, Object body}) async {
    http.Response res;
    res = await http
        .post(
          uri,
          headers: await getRequestHeaders(),
          body: jsonEncode(body),
        )
        .timeout(Duration(seconds: 45));
    return res;
  }

  @override
  Future<http.Response> putHttpResponse({Uri uri, Object body}) async {
    http.Response res;
    res = await http
        .post(
          uri,
          headers: await getRequestHeaders(),
          body: jsonEncode(body),
        )
        .timeout(Duration(seconds: 45));
    return res;
  }

  @override
  Future<http.Response> noAuthPostHttpResponse({Uri uri, Object body}) async {
    http.Response res;
    res = await http
        .post(
          uri,
          headers: await getRequestHeaders(isNotAuthenticated: true),
          body: jsonEncode(body),
        )
        .timeout(Duration(seconds: 45));
    return res;
  }
}
