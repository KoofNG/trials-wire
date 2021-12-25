import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/core/config/view_model/base_view_model.dart';
import 'package:wirepay/core/constants/string_constant.dart';

class WalletScreenViewModel extends BaseViewModel {
  final StorageService _storageService;

  WalletScreenViewModel({
    StorageService service,
  }) : _storageService = service;

  String userName = '';

  Future<void> getUserWireTag() async {
    userName = await _storageService.getString(key: WIREPAYTAG);
    notifyListeners();
  }

  Future<void> getUserWallets() async {}
}
