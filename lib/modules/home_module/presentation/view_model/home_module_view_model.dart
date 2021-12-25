import 'package:flutter/material.dart';
import 'package:wirepay/core/config/services/storage_service/storage_service.dart';
import 'package:wirepay/core/config/view_model/base_view_model.dart';
import 'package:wirepay/core/constants/string_constant.dart';
import 'package:wirepay/modules/home_module/data/bottom_menu.dart';

class HomeModuleViewModel extends BaseViewModel {
  final StorageService _storageService;

  String _userWireTag = '';

  List bottomNavbarMenus = [
    BottomMenuButton(name: 'Wallets', icon: Icons.payment),
    BottomMenuButton(name: 'Cards', icon: Icons.credit_card),
    BottomMenuButton(name: 'Transactions', icon: Icons.timeline),
    BottomMenuButton(name: 'Profile', icon: Icons.person_outline_outlined),
  ];

  int currentTabIndex = 0;

  String get userWireTag => _userWireTag;

  HomeModuleViewModel({
    @required StorageService storageService,
  }) : _storageService = storageService;

  Future<void> getUserWireTag() async {
    _userWireTag = await _storageService.getString(key: WIREPAYTAG);
    print(_userWireTag);
  }

  void setPageIndex({int page}) {
    currentTabIndex = page;
    notifyListeners();
  }
}
