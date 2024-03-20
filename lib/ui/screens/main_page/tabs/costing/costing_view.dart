import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tu_kar/ui/widgets/heading.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class CostingView extends StatelessWidget {
  const CostingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: StringConstants.ratesForToday),
    listOfRatings(),
      ],
    );
  }

  Widget listOfRatings(){
    return  Expanded(
      child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => ratingTile(context)),
    );
    }


  Widget ratingTile(BuildContext context){
  return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(AppImages.ironImage),
        10.widthSizedBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ironing- for 5 clothes",style: Theme.of(context).textTheme.labelLarge,),
            Text("C 50",style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    ).paddingSymmetric(vertical: 10,horizontal: 0.05.sw);
  }

}
