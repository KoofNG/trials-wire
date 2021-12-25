import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/core/config/view_model/base_view_model.dart';
import 'package:wirepay/core/constants/string_constant.dart';
import 'package:wirepay/modules/wallet_module/data/models/wallet_model.dart';
import 'package:wirepay/modules/wallet_module/data/repositories/wallet_repo.dart';

class WalletScreenViewModel extends BaseViewModel {
  final StorageService _storageService;
  final WalletRepository _walletRepository;

  WalletScreenViewModel({
    StorageService service,
    WalletRepository walletRepository,
  })  : _storageService = service,
        _walletRepository = walletRepository;

  String userName = '';
  List<WalletDto> wallets = [];

  Future<void> getUserWireTag() async {
    userName = await _storageService.getString(key: WIREPAYTAG);
    notifyListeners();
  }

  Future<void> getUserWallets() async {
    setBusy(true);
    var _data = await _walletRepository.fetchAllWallets();
    setBusy(false);
    wallets = _data.data ?? <WalletDto>[];
    notifyListeners();
  }
}
