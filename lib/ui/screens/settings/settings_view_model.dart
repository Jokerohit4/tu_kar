import 'package:flutter/material.dart';
import 'package:tu_kar/utils/constants/app_keys.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';

class SettingsViewModel extends ChangeNotifier{


  List  <Map<String,dynamic>>  get optionsGeneralDetails => _optionsGeneralDetails;
  List  <Map<String,dynamic>>  get optionsPreferencesDetails => _optionsPreferencesDetails;
  List  <Map<String,dynamic>>  get logoutDetails => _logOutDetails;

  final List <Map<String,dynamic>> _optionsGeneralDetails =[
    {
      AppKeys.icon: Icons.person_3_outlined,
      AppKeys.title: StringConstants.editProfile,
      AppKeys.subtitle: "Change proof of your existence",
      AppKeys.onTap: () => _onTapEditProfile(),
    },
    {
      AppKeys.icon: Icons.lock_outline,
      AppKeys.title: StringConstants.changePassword,
      AppKeys.subtitle: "You gotta stay safe macha",
      AppKeys.onTap: () => _onTapChangePassword(),
    },
    {
      AppKeys.icon: Icons.payment,
      AppKeys.title: StringConstants.payments,
      AppKeys.subtitle: "Because money needs reassurance",
      AppKeys.onTap: () => _onTapPayments(),
    },
  ];

  final List <Map<String,dynamic>> _optionsPreferencesDetails =[
    {
      AppKeys.icon: Icons.notifications_active_outlined,
      AppKeys.title: StringConstants.notifications,
      AppKeys.subtitle: "Tap to move baby!!!",
      AppKeys.onTap: () => _onTapNotifications(),
    },
  ];


  final List <Map<String,dynamic>> _logOutDetails =[
    {
      AppKeys.icon: Icons.logout,
      AppKeys.title: StringConstants.logout,
      AppKeys.subtitle: "Wrong move!",
      AppKeys.onTap: () => _onTapLogout(),
    },
  ];




  static void _onTapEditProfile(){}

  static void _onTapChangePassword(){}

  static void _onTapPayments(){}

  static void _onTapNotifications(){}

  static void _onTapLogout(){}

  static void _onTapPhoneNumber(){}



}