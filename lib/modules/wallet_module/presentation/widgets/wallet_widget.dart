import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/utilities/currency_helper.dart';
import 'package:wirepay/modules/wallet_module/data/models/wallet_model.dart';

class WalletWidget extends StatelessWidget {
  final WalletDto walletDto;

  WalletWidget({WalletDto walletDto}) : walletDto = walletDto;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CurrencyNameConverter.getCurrencyName(
                currencyName: walletDto.currency),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            walletDto.availableBalance.toDouble().toStringAsFixed(2) +
                ' ' +
                walletDto.currency,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
