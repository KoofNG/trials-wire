import 'package:get_it/get_it.dart';
import 'package:wirepay/core/services/network_service/network_service_abstract.dart';
import 'package:wirepay/core/services/network_service/network_service_impl.dart';
import 'package:wirepay/core/services/storage_service/storage_service.dart';

GetIt di = GetIt.instance;

Future<void> registerAllDependencies() async {
  // Register all services
  di.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
  di.registerLazySingleton<StorageService>(() => StorageService());

  // Register all repositories
  // di.registerLazySingleton<DashboardRepository>(
  //   () => DashboardRepositoryImpl(
  //     dashboardService: di(),
  //   ),
  // );
}
