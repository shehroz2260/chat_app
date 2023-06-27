import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main_tab/chat_tabs.dart';
import '../main_tab/home_tab.dart';
import '../main_tab/setting_tab.dart';

class MainController extends GetxController {
  Widget _currentTab = _mainTabs[0];
  int _currentIndex = 0;

  Widget get currentTab => _currentTab;
  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    _currentTab = _mainTabs[index];
    update();
  }
}

const List<Widget> _mainTabs = <Widget>[
  HomeTab(),
  ChatTab(),
  SettingTab(),
];

List<String> mainTabsLabel = <String>["Home".tr, "Chats".tr, "Settings".tr];
