import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/extension/extension.dart';


class OptionsBox extends StatelessWidget {
  const OptionsBox({super.key, required this.options, required this.heading});
 final List <Map<String,dynamic>> options;
 final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      margin: EdgeInsets.symmetric(vertical: 0.02.sh, horizontal: 0.03.sw),
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: AppColors.greyColor,
              offset: Offset(0, -2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.greyColor,
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          heading.isEmpty
          ? const SizedBox.shrink()
          : Text(
            heading,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.greyColor.withOpacity(0.5)),
          ),
          heading.isEmpty
          ? const SizedBox.shrink()
          : 0.015.sh.heightSizedBox,
          SizedBox(
            height: options.length == 1 ? 0.08.sh : 0.068.sh * options.length,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return tile(options[index], context);
                }
            ),
          ),
        ],
      ),
    );
  }

  Widget tile(Map<String,dynamic>option, BuildContext context ){
    IconData icon = option["icon"];
    String title = option["title"];
    String subtitle = option["subtitle"];
    void onTap = option["onTap"];
    return GestureDetector(
      onTap: ()=>onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWithBg(icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: Theme.of(context).textTheme.labelLarge),
              Text(subtitle,style: Theme.of(context).textTheme.bodySmall),
              10.heightSizedBox,
            ],
          ),
        ],
      ),
    );
  }


  Widget iconWithBg(IconData icon){
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 3),
        margin: const EdgeInsets.only(right: 20,bottom: 10),
        width: 0.07.sw,
        height: 0.07.sw,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightGreyColor,
        ),
        child: Icon(icon, color: AppColors.primaryColor,size: 20,));
  }

}
