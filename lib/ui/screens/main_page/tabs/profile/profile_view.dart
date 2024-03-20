import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/profile/profile_view_model.dart';
import 'package:tu_kar/ui/widgets/heading.dart';
import 'package:tu_kar/ui/widgets/options_box.dart';
import 'package:tu_kar/ui/widgets/score_card_dp.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading(context),
         const ScoreCardDp(),
          0.02.sh.heightSizedBox,
          holeHouseBox(context),
          moreStuff(context),
        ],
      ).paddingSymmetric(horizontal: 0.03.sw),
    );
  }

  Widget heading(BuildContext context) {
    return const Heading(title: StringConstants.profile, hasIcon: false);
  }


  Widget holeHouseBox(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);
    return OptionsBox(heading: StringConstants.holeHouse,options: viewModel.optionsHoleHouse);
  }

  Widget moreStuff(BuildContext context){
    final viewModel = Provider.of<ProfileViewModel>(context);
    return OptionsBox(heading : "",options: viewModel.optionsMoreStuff);
  }




}
