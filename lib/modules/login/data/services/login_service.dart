import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wirepay/core/config/services/network_service/network_service_impl.dart';
import 'package:wirepay/core/constants/app_endpoints.dart';
import 'package:wirepay/modules/login/data/models/login_data.dart';

class LoginService extends NetworkServiceImpl {
  // Login with Password method
  Future<http.Response> loginWithPassword({
    @required LoginDataDto loginDataDto,
  }) async {
    Uri _uri = Uri.https(
      AppEndpoint.baseUrl,
      AppEndpoint.apiVersion + AppEndpoint.loginEndpoint,
    );
    return await noAuthPostHttpResponse(
      uri: _uri,
      body: loginDataDto.toJson(),
    );
  }
}
