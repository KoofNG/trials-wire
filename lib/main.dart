import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/provider_service/providers.dart';
import 'modules/login/presentation/screen/login_screen.dart';

class WirePay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
