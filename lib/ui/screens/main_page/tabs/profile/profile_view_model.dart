import 'package:flutter/material.dart';
import 'package:tu_kar/utils/constants/app_keys.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';

class ProfileViewModel extends ChangeNotifier {


  List  <Map<String,dynamic>>  get optionsHoleHouse => _optionsHoleHouse;
  List  <Map<String,dynamic>>  get optionsMoreStuff => _optionsMoreStuff;

  final List <Map<String,dynamic>> _optionsHoleHouse = [
    {
      AppKeys.icon: Icons.home_outlined,
      AppKeys.title: StringConstants.holeHouse,
      AppKeys.subtitle: "House of Dragons",
      AppKeys.onTap: () => _onTapHome(),
    },
    {
      AppKeys.icon: Icons.family_restroom_outlined,
      AppKeys.title:StringConstants.modernFamily,
      AppKeys.subtitle: "Somendu, Deval, Rohit, Lala",
      AppKeys.onTap: () => _onTapFamily(),
    },
    {
      AppKeys.icon: Icons.person_2_outlined,
      AppKeys.title:StringConstants.major,
      AppKeys.subtitle: "Lala",
      AppKeys.onTap: () => _onTapMajor(),
    },
    {
      AppKeys.icon: Icons.timer_outlined,
      AppKeys.title:StringConstants.duration,
      AppKeys.subtitle: "Been a while - 1 year, 6 months, 3 weeks, 2 days to be exact.",
      AppKeys.onTap: () => _onTapDuration(),
    },
  ];


  final List <Map<String,dynamic>> _optionsMoreStuff =[
    {
      AppKeys.icon: Icons.qr_code_scanner,
      AppKeys.title: StringConstants.scanCode,
      AppKeys.subtitle: "Add your brothers",
      AppKeys.onTap: () => _onTapQr(),
    },

    {
      AppKeys.icon: Icons.workspace_premium_outlined,
      AppKeys.title: StringConstants.dibsPro,
      AppKeys.subtitle: "To be pro, you gotta go bruh",
      AppKeys.onTap: () => _onTapPro(),
    },
  ];

  static void _onTapHome() {}

  static void _onTapFamily(){}

  static void _onTapMajor(){}

  static void _onTapDuration(){}

  static void _onTapQr() {}

  static void _onTapPro(){}



}
