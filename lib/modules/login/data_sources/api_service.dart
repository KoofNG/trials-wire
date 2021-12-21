import 'package:http/http.dart' as http;

class NetworkService {
  static Future<http.Response> postMethod({Uri uri, Object data}) async {
    var _result;

    try {
      _result = await http.post(uri, body: data);
    } catch (e) {
      throw e;
    }

    return _result;
  }
}
