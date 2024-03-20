import 'package:flutter/cupertino.dart';
import 'package:tu_kar/services/routes/routes.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class OnboardingViewModel extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final PageController _pageController = PageController(
    initialPage: 0,
  );
   int  _currentPage = 0;

  TextEditingController get emailController => _emailController;

  TextEditingController get nameController => _nameController;

  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get otpController => _otpController;

  PageController get pageController => _pageController;

  String giveButtonName(bool isEmail) {
    return isEmail
        ? "Let's begin the game"
        : _currentPage == 0
            ? "Time to go to the next step"
            : "Let's begin the game";
  }

  void onPressButton(BuildContext context, bool isEmail){
    if (_pageController.page == 0) {
      isEmail
      ?   context.navigateTo(Routes.mainViewRoute,null)
      : _pageController.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
    else {
    context.navigateTo(Routes.mainViewRoute,null);
    }
  }

  void onPageChanged(int page){
    _currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _otpController.dispose();
    super.dispose();
  }

}
