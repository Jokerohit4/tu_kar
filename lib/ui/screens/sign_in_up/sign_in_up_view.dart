
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/sign_in_up/sign_in_up_view_model.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';


class SignInUpView extends StatelessWidget {
  const SignInUpView({super.key, required this.isSignUp});

  final bool isSignUp;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignInUpViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.dibsieLogo,
            height: 0.2.sh,
            fit: BoxFit.fill,
          ),
          field(true,viewModel),
          field(false,viewModel),
          0.02.sh.heightSizedBox,
          ThemeButton(title: isSignUp ? StringConstants.signUp : StringConstants.login , onTap: () => viewModel.signUpEmail()),
          0.02.sh.heightSizedBox,
          isSignUp ? signUpWays() : 0.widthSizedBox,
          0.01.sh.heightSizedBox,
          // Text("Sign up using",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor)),
          Image.asset(AppImages.appLogo,
                  width: 1.sw,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }



  Widget field(bool isEmail,SignInUpViewModel viewModel){
    return Container(
      width: 0.9.sw,
      margin: EdgeInsets.symmetric(vertical: 0.02.sh,horizontal: 0.05.sw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyColor,
            offset: Offset(0,4),
            blurRadius: 2,
            spreadRadius: 4,
          )
        ],
      ),
      child:  TextField(
        controller: isEmail ? viewModel.emailController : viewModel.passwordController,
        keyboardType:  TextInputType.text,
        obscureText: !isEmail ,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
          hintText: isEmail ? StringConstants.typeInYourMailOrPhoneNumber : StringConstants.enterPassword , // Placeholder text
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(isEmail ? Icons.account_circle_rounded : Icons.lock), // Search icon at the end
        ),
      ),
    );
  }


  Widget signUpWays(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loginBox(AppImages.phoneUrl),
        0.05.sw.widthSizedBox,
        loginBox(AppImages.googleLogoUrl),
      ],
    );
  }

  Widget loginBox(String imgUrl){
    return Container(
      width: 0.05.sh,
      height: 0.05.sh,
      padding: EdgeInsets.all(0.01.sw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyColor,
            offset: Offset(0,4),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Image.network(imgUrl),
    );
  }


}
