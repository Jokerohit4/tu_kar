import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/onboarding_view_model.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/pages/name_email_number_screen.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/pages/otp_screen.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_images.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.isEmail});

  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.allCharactersPage),
          SizedBox(
            height: 0.3.sh,
            width: 1.sw,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: viewModel.pageController,
              onPageChanged: (page)=>viewModel.onPageChanged(page),
              children: [
                NameEmailNumberScreen( isEmail: isEmail),
                const OtpScreen(),
              ],
            ),
          ),
          ThemeButton(title: viewModel.giveButtonName(isEmail), onTap: ()=>viewModel.onPressButton(context,isEmail)),
        ]
      ),
    );
  }


}
