import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/model/result_model.dart';
import 'package:wirepay/core/config/repository/base_repository.dart';
import 'package:wirepay/modules/wallet_module/data/models/wallet_model.dart';
import 'package:wirepay/modules/wallet_module/data/services/wallet_service.dart';

class WalletRepository extends BaseRepositoryImpl {
  final WalletService _walletService;

  WalletRepository({
    @required WalletService walletService,
  }) : _walletService = walletService;

  Future<Result<List<WalletDto>>> fetchAllWallets() async {
    var result = Result<List<WalletDto>>();
    try {
      var res = await _walletService.getWallets();

      var _data = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var _rawList = _data['data'] as List;
        List<WalletDto> _parsedData =
            _rawList.map((e) => WalletDto.fromJson(e)).toList();
        result = Result<List<WalletDto>>(
          data: _parsedData,
          isSuccessful: _data['success'],
          message: _data['message'],
        );
      }

      if (res.statusCode >= 400) {
        result = Result<List<WalletDto>>(
          isSuccessful: _data['status'],
          message: _data['message'],
          data: <WalletDto>[],
        );
      }
    } catch (e) {
      var res = await buildErrorResponse(error: e);
      result = Result<List<WalletDto>>(
        data: <WalletDto>[],
        isSuccessful: res.isSuccessful,
        message: res.message,
      );
    }
    return result;
  }
}
