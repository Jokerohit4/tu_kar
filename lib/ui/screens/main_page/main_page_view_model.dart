


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/services/routes/route_arguments.dart';
import 'package:tu_kar/services/routes/routes.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view_model.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class MainPageViewModel extends ChangeNotifier{

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void selectIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void goToAddContactsGroups(BuildContext context){
    bool isGroup = context.read<HomePageViewModel>().selectedTabIndex == 0 ? true : false;
    context.navigateTo(Routes.addContactsGroupsViewsRoute,AddGroupFriendRouteArguments(isGroup));
  }


}