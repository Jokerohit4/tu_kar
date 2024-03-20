import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tu_kar/ui/widgets/heading.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/app_images.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(title: StringConstants.notifications, hasIcon: false),
        notification(context),
      ],
    );
  }

  Widget notification(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
          return Row(
            children: [
              Image.asset(AppImages.profilePicture,width: 0.17.sw,),
              20.widthSizedBox,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Somendu paid back 23 aehsaan for ironing ",style: Theme.of(context).textTheme.bodyLarge),
                  Text("Is under 2300 aehsaan under you",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.lightGreenColor),),
                 groupNameAndTimeBox(context),
                ],
              ),
            ],
          ).paddingSymmetric(vertical: 0.01.sw,horizontal: 0.05.sw);
        }
      ),
    );
  }

  Widget groupNameAndTimeBox(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 0.03.sh,
          width: 0.2.sw,
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ]),
          child: Center(child: Text("Shrupnakha",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.whiteColor),)),
        ),
        Container(
          height: 0.03.sh,
          width: 0.2.sw,
          decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyColor,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ]),
          child: Center(child: Text("yesterday, 7:45 PM",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor),)),
        ),
      ],
    ).paddingSymmetric(vertical: 3);
  }
}
