import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class ScoreCardDp extends StatelessWidget {
  const ScoreCardDp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              AppImages.profilePicture,
              width: 0.35.sw,
            ),
            Container(
              height: 0.095.sh,
              width: 0.7.sw,
              padding: EdgeInsets.symmetric(horizontal: 0.1.sw),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.greyColor,
                      offset: Offset(0, -4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: AppColors.greyColor,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("23,300",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.primaryColor)),
                      Text("favours",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  0.12.sw.widthSizedBox,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("900",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.redColor)),
                      Text("jobs",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
