import 'package:http/http.dart' as http;
import 'package:wirepay/core/config/services/network_service/network_service_impl.dart';
import 'package:wirepay/core/constants/app_endpoints.dart';

class WalletService extends NetworkServiceImpl {
  Future<http.Response> getWallets() async {
    Uri _uri = Uri.https(
      AppEndpoint.baseUrl,
      AppEndpoint.apiVersion + AppEndpoint.walletEndpoint,
    );
    return await getHttpResponse(uri: _uri);
  }
}
