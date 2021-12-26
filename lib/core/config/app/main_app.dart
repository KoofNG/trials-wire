import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/service_locator/services_locator.dart';

import '../../../main.dart';

Future<void> mainCommon({String env}) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await registerAllDependencies();

  await runZonedGuarded(
    () async => runApp(WirePay()),
    (dynamic error, StackTrace stackTrace) {
      return log('<<<<<<< CAUGHT DART ERROR $error >>>>>>>');
    },
  );
}
