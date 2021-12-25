import 'package:get_it/get_it.dart';
import 'package:wirepay/core/config/services/network_service/network_service_abstract.dart';
import 'package:wirepay/core/config/services/network_service/network_service_impl.dart';
import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/modules/login/data/repositories/login_repo.dart';
import 'package:wirepay/modules/login/data/services/login_service.dart';
import 'package:wirepay/modules/wallet_module/data/repositories/wallet_repo.dart';
import 'package:wirepay/modules/wallet_module/data/services/wallet_service.dart';

GetIt di = GetIt.instance;

Future<void> registerAllDependencies() async {
  // Register all services
  di.registerLazySingleton<StorageService>(() => StorageService());
  di.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
  di.registerLazySingleton<LoginService>(() => LoginService());
  di.registerLazySingleton<WalletService>(() => WalletService());

  // Register all repositories
  di.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      loginService: di(),
    ),
  );
  di.registerLazySingleton<WalletRepository>(
    () => WalletRepository(
      walletService: di(),
    ),
  );
}
