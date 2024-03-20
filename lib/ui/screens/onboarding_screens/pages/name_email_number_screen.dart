import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/onboarding_view_model.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class NameEmailNumberScreen extends StatelessWidget {
  const NameEmailNumberScreen({super.key,required this.isEmail});
final bool isEmail;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name", style: Theme.of(context).textTheme.labelLarge)
            .paddingSymmetric(horizontal: 0.1.sw),
        nameField(viewModel, context),
        0.02.sh.heightSizedBox,
        Text(isEmail ? StringConstants.email : StringConstants.phoneNumber,
            style: Theme.of(context).textTheme.labelLarge)
            .paddingSymmetric(horizontal: 0.1.sw),
        emailPhoneField(viewModel,context),
      ],
    );
  }
  Widget emailPhoneField(OnboardingViewModel viewModel,BuildContext context) {
    return TextField(
      controller:
      isEmail ? viewModel.emailController : viewModel.phoneNumberController,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.phone,
      decoration: InputDecoration(
        contentPadding:  EdgeInsets.symmetric(vertical: 15, horizontal: 0.03.sw),
        hintText: isEmail
            ? StringConstants.emailHintText
            : StringConstants.phoneNumberHintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        fillColor: AppColors.greyWalaShade,
        filled: true,
        // prefixIcon:
        //     Icon(isEmail ? Icons.mail : Icons.phone), // Search icon at the end
      ),
    ).paddingSymmetric(horizontal: 0.1.sw, vertical: 0.01.sh);
  }

  Widget nameField(OnboardingViewModel viewModel, BuildContext context) {
    return TextField(
      controller: viewModel.nameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0.03.sw),
        hintText: StringConstants.nameHintText,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.greyColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        fillColor: AppColors.greyWalaShade,
        filled: true,
      ),
    ).paddingSymmetric(horizontal: 0.1.sw, vertical: 0.01.sh);
  }
}
