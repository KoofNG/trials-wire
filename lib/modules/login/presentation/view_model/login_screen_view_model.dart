import 'package:flutter/material.dart';
import 'package:wirepay/core/config/model/result_model.dart';
import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/core/config/view_model/base_view_model.dart';
import 'package:wirepay/core/constants/string_constant.dart';
import 'package:wirepay/main.dart';
import 'package:wirepay/modules/home_module/presentation/screens/home_screen.dart';
import 'package:wirepay/modules/login/data/models/login_data.dart';
import 'package:wirepay/modules/login/data/models/user_details_data.dart';
import 'package:wirepay/modules/login/data/repositories/login_repo.dart';

class LoginScreenViewModel extends BaseViewModel {
  final LoginRepository _loginRepository;
  final StorageService _storageService;

  LoginScreenViewModel({
    @required LoginRepository loginRepository,
    @required StorageService storageService,
  })  : _loginRepository = loginRepository,
        _storageService = storageService;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithPassword() async {
    if (!formKey.currentState.validate()) return;

    LoginDataDto _loginDataDto = LoginDataDto(
      email: emailController.value.text,
      password: passwordController.value.text,
    );

    setBusy(true);
    Result<ResponseUserDetailsDto> response =
        await _loginRepository.loginWithPassword(
      loginDto: _loginDataDto,
    );
    setBusy(false);

    if (response.isSuccessful) {
      final _token = response.data.token;
      final _wirePayTag = response.data.wirepayTag;
      _storageService.setString(key: TOKEN, value: _token);
      _storageService.setString(key: WIREPAYTAG, value: _wirePayTag);
      Navigator.push(
        navigatorKey.currentContext,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.red[400],
        content: Text(
          response.message ?? 'Something went wrong',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      );
      ScaffoldMessenger.of(navigatorKey.currentContext).showSnackBar(snackBar);
    }
  }
}
