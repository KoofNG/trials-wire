import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wirepay/core/config/service_locator/services_locator.dart';
import 'package:wirepay/core/widgets/base_widget.dart';
import 'package:wirepay/modules/home_module/presentation/view_model/home_module_view_model.dart';
import 'package:wirepay/modules/home_module/presentation/widgets/animated_index_widget.dart';
import 'package:wirepay/modules/home_module/presentation/widgets/bottom_navbar_widget.dart';
import 'package:wirepay/modules/wallet_module/presentation/screens/wallet_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeModuleViewModel>(
      model: HomeModuleViewModel(
        storageService: di(),
      ),
      onModelReady: (model) async {
        model.getUserWireTag();
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Color(0xFF303F9F),
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: AnimatedIndexedStack(
              index: model.currentTabIndex,
              children: [
                WalletScreen(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 80.0,
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...model.bottomNavbarMenus.map(
                    (e) {
                      int _index = model.bottomNavbarMenus.indexOf(e);
                      return InkWell(
                        onTap: () => model.setPageIndex(page: _index),
                        child: BottomNavBarItem(
                          item: e,
                          isActive: model.currentTabIndex == _index,
                        ),
                      );
                    },
                  ).toList()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
