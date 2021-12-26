import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/service_locator/services_locator.dart';
import 'package:wirepay/core/widgets/base_widget.dart';
import 'package:wirepay/modules/wallet_module/data/models/wallet_model.dart';
import 'package:wirepay/modules/wallet_module/presentation/view_model/wallet_screen_view_model.dart';
import 'package:wirepay/modules/wallet_module/presentation/widgets/wallet_widget.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<WalletScreenViewModel>(
      model: WalletScreenViewModel(
        service: di(),
        walletRepository: di(),
      ),
      onModelReady: (model) async {
        await model.getUserWireTag();
        await model.getUserWallets();
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFF303F9F),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 25.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello \$${model.userName},',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'What would you like to do today?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.qr_code,
                                color: Colors.white,
                                size: 45.0,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  primary: Color(0xff001970),
                                ),
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'FUND WALLET',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  primary: Color(0xff001970),
                                ),
                                onPressed: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    'WITHDRAW',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Text(
                        'WALLETS',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF001970),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: model.busy
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Color(0xFF303F9F),
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: Colors.grey[400],
                                );
                              },
                              itemBuilder: (context, index) {
                                WalletDto _walletDto = model.wallets[index];
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: WalletWidget(
                                      walletDto: _walletDto,
                                    ));
                              },
                              itemCount: model.wallets.length,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
