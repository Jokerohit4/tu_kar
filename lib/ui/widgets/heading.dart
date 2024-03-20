import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view_model.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';



class Heading extends StatelessWidget {
  const Heading({super.key, required this.title, this.hasIcon = false});
 final String title;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return hasIcon
    ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineLarge),
        IconButton(onPressed: ()=>context.read<HomePageViewModel>().onTapSettings(context), icon: const Icon(Icons.settings_rounded)),
      ],
    ).paddingSymmetric(horizontal: 0.03.sw, vertical: 0.005.sh)
        :  Text(title,
        style: Theme.of(context).textTheme.headlineLarge).paddingSymmetric(horizontal: 0.03.sw, vertical: 0.03.sh);
  }
}
