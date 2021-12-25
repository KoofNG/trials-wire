import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/model/result_model.dart';
import 'package:wirepay/core/config/repository/base_repository.dart';
import 'package:wirepay/modules/login/data/models/login_data.dart';
import 'package:wirepay/modules/login/data/models/user_details_data.dart';
import 'package:wirepay/modules/login/data/services/login_service.dart';

class LoginRepository extends BaseRepositoryImpl {
  final LoginService _loginService;

  LoginRepository({
    @required LoginService loginService,
  }) : _loginService = loginService;

  Future<Result<ResponseUserDetailsDto>> loginWithPassword({
    @required LoginDataDto loginDto,
  }) async {
    var result = Result<ResponseUserDetailsDto>();
    try {
      var res = await _loginService.loginWithPassword(loginDataDto: loginDto);

      var _data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        result = Result<ResponseUserDetailsDto>(
          data: ResponseUserDetailsDto.fromJson(_data['data']),
          isSuccessful: _data['success'],
          message: _data['message'],
        );
      }

      if (res.statusCode >= 400) {
        result = Result<ResponseUserDetailsDto>(
          isSuccessful: _data['status'],
          message: _data['message'],
          data: ResponseUserDetailsDto.initial(),
        );
      }
    } catch (e) {
      var res = await buildErrorResponse(error: e);
      result = Result<ResponseUserDetailsDto>(
        data: ResponseUserDetailsDto.initial(),
        isSuccessful: res.isSuccessful,
        message: res.message,
      );
    }
    return result;
  }
}
