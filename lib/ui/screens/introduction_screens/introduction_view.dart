import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tu_kar/services/routes/routes.dart';
import 'package:tu_kar/ui/widgets/theme_button.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class IntroScreenDemo extends StatefulWidget {
  const IntroScreenDemo({super.key});

  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 30000,
      infiniteAutoScroll: false,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child:Image.asset(AppImages.dibsieLogo, width: 0.1.sw),
      //     ),
      //   ),
      // ),
      globalFooter:ThemeButton(title: "Let's begin the game",onTap: (){},),
      pages: [
        buildPage(StringConstants.welcomeToDibs,StringConstants.guruJiSaysHello,AppImages.dibsieGuruFuckYou),
        buildPage(StringConstants.welcomeToDibs,StringConstants.guruJiSaysHello,AppImages.dibsieFormals),
        buildPage(StringConstants.welcomeToDibs,StringConstants.guruJiSaysHello,AppImages.dibsieGuruFuckYou),
        buildPage(StringConstants.welcomeToDibs,StringConstants.guruJiSaysHello,AppImages.dibsieGuruFuckYou),
        // PageViewModel(
        //   title: "Full Screen Page",
        //   body:
        //       "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
        //   image: _buildFullscreenImage(),
        //   decoration: pageDecoration.copyWith(
        //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
        //     fullScreen: true,
        //     bodyFlex: 2,
        //     imageFlex: 3,
        //     safeArea: 100,
        //   ),
        // ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('relaxing.png'),
        //   footer: ElevatedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.lightBlue,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //     ),
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 6,
        //     imageFlex: 6,
        //     safeArea: 80,
        //   ),
        // ),
        // PageViewModel(
        //   title: "Title of last page - reversed",
        //   bodyWidget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Click on ",
        //         style: Theme.of(context).textTheme.labelLarge!,
        //       ),
        //       const Icon(Icons.edit),
        //       Text(
        //         " to edit a post",
        //         style: Theme.of(context).textTheme.labelLarge!,
        //       ),
        //     ],
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 2,
        //     imageFlex: 4,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //   image: _buildImage('1.png'),
        //   reverse: false,
        // ),
      ],
      onDone: () => onIntroEnd(context),
      onSkip: () => onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  PageViewModel buildPage(String title, String body, String appImage) {
    return PageViewModel(
        title: title,
        body: body,
        image: Image.asset(appImage, width: 1.sw),
        decoration: PageDecoration(
          titleTextStyle: Theme.of(context).textTheme.titleLarge!,
          bodyTextStyle: Theme.of(context).textTheme.labelLarge!,
          bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          pageColor: Colors.white,
          imagePadding: EdgeInsets.zero,
        ));
  }



  void onIntroEnd(BuildContext context) {
    context.navigateTo(Routes.mainViewRoute, null);
  }

  Widget buildFullscreenImage() {
    return Image.asset(
      'assets/permanent/10.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
