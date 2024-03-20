import 'package:flutter/material.dart';
import 'package:tu_kar/services/routes/routes.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class HomePageViewModel with ChangeNotifier{



  int _selectedTabIndex = 0;


  Color _groupColor = AppColors.primaryColor;
  Color _friendsColor = AppColors.blackColor;


  int get selectedTabIndex => _selectedTabIndex;
  Color get groupColor => _groupColor;
  Color get friendsColor => _friendsColor;

  void selectTab(int index) {
    _selectedTabIndex = index;
    if (index == 1)
      {
        _friendsColor = AppColors.primaryColor;
        _groupColor = AppColors.blackColor;
      }
    else {
      _groupColor  = AppColors.primaryColor;
      _friendsColor = AppColors.blackColor;
    }
    notifyListeners();
  }


  void onTapSettings(BuildContext context){
    context.navigateTo(Routes.settingsViewRoute,null);
  }



}