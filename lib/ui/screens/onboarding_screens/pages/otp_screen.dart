import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/onboarding_view_model.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        0.1.sh.heightSizedBox,
        Text("One Time Password (OTP)", style: Theme.of(context).textTheme.labelLarge),
        0.03.sh.heightSizedBox,
        PinCodeTextField(
          appContext: context,
          length: 6, // The length of the OTP
          controller: viewModel.otpController,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            selectedColor: AppColors.primaryColor,
            inactiveColor: AppColors.blackColor,
          ),
          onCompleted: (pin) {
            // _verifyOtp(pin); // Optionally auto-verify upon completion
          },
        ),
      ],
    ).paddingSymmetric(horizontal: 0.1.sw);
  }
}
