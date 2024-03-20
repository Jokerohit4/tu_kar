import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/settings/settings_view_model.dart';
import 'package:tu_kar/ui/widgets/heading.dart';
import 'package:tu_kar/ui/widgets/options_box.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SettingsViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          const Heading(title: StringConstants.settings),
          profileBar(context),
          generalBlock(viewModel),
          preferencesBlock(viewModel),
          logOutBlock(viewModel),
        ],
      ),
    );
  }

  Widget profileBar(BuildContext context) {
    return Container(
      width: 0.9.sw,
      margin: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.03.sw),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyColor,
              offset: Offset(0, -2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.greyColor,
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        children: [
          Image.asset(
            AppImages.profilePicture,
            height: 0.07.sh,
          ),
          0.05.sw.widthSizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aditya Shukla",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                "+91-9354859197",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget generalBlock(SettingsViewModel viewModel) {
    return OptionsBox(
        options: viewModel.optionsGeneralDetails,
        heading: StringConstants.general);
  }

  Widget preferencesBlock(SettingsViewModel viewModel) {
    return OptionsBox(
        options: viewModel.optionsPreferencesDetails,
        heading: StringConstants.preferences);
  }

  Widget logOutBlock(SettingsViewModel viewModel) {
    return OptionsBox(options: viewModel.logoutDetails,heading : "",);
  }
}
