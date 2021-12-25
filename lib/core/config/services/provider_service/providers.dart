import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wirepay/core/config/service_locator/services_locator.dart';
import 'package:wirepay/modules/home_module/presentation/view_model/home_module_view_model.dart';
import 'package:wirepay/modules/login/presentation/view_model/login_screen_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginScreenViewModel>(
    create: (_) => LoginScreenViewModel(
      loginRepository: di(),
      storageService: di(),
    ),
  ),
  ChangeNotifierProvider<HomeModuleViewModel>(
    create: (_) => HomeModuleViewModel(
      storageService: di(),
    ),
  ),
];
