import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view_model.dart';
import 'package:tu_kar/ui/widgets/heading.dart';
import 'package:tu_kar/ui/widgets/score_card_dp.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';
import 'package:tu_kar/utils/constants/string_constants.dart';
import 'package:tu_kar/utils/extension/extension.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    print("fwgtyuhdeijodwuhyghdiyewgfdw8yefghiwuehfwue");
    return Column(
      children: [
        heading(context),
        const ScoreCardDp(),
       0.03.sh.heightSizedBox,
         tabs(),
      ],
    );
  }

  Widget heading(BuildContext context) {
    return const Heading(title: StringConstants.appTitle, hasIcon: true);
  }


  Widget tabs() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Consumer<HomePageViewModel>(
      builder: (context, homeProvider, _) => Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 0.08.sh,
              width: 1.sw,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => homeProvider.selectTab(0),
                    child:  Text(StringConstants.groups,style: Theme.of(context).textTheme.labelLarge!.copyWith(color: homeProvider.groupColor ),),
                  ),
                  GestureDetector(
                    onTap: () => homeProvider.selectTab(1),
                    child:  Text(StringConstants.friends,style: Theme.of(context).textTheme.labelLarge!.copyWith(color: homeProvider.friendsColor ),),
                  ),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: homeProvider.selectedTabIndex,
                children: [
                  groups(),
              StreamBuilder<QuerySnapshot>(
                stream: firestore.collection('Friends').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  List<DocumentSnapshot> docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['amount'] ?? 'No Name'),
                        subtitle: Text(data['description'] ?? 'No Contact'),
                      );
                    },
                  );
                },
              ),
              //    friends(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget groups() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          height: 0.1.sh,
          width: 0.7.sw,
          margin: EdgeInsets.symmetric(vertical: 0.02.sh,horizontal: 0.03.sw),
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
            children: [
              coloredCornerBox(),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shrupnakha",style: Theme.of(context).textTheme.labelLarge,),
                  Text("Somendu, Adarsh, Aditi, Rohit, Bindu, Dabur",style: Theme.of(context).textTheme.bodySmall,),
                ],
              ),
              10.expandedWidthSizedBox,
              Column(
                children: [
                  5.heightSizedBox,
                  const Text("500+",style: TextStyle(fontSize: 10,color: AppColors.redColor),),
                ],
              ),
              10.widthSizedBox,
            ],
          ),
        );
      },
    );
  }

  Widget friends() {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          height: 0.1.sh,
          width: 0.7.sw,
          margin: EdgeInsets.symmetric(vertical: 0.02.sh,horizontal: 0.03.sw),
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
            children: [
              coloredCornerBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shrupnakha",style: Theme.of(context).textTheme.labelLarge,),
                  Text("Is drowned by 500",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.lightGreenColor),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget coloredCornerBox(){
    return Container(
      width: 0.2.sw,
      height: 0.1.sh,
      margin: EdgeInsets.only(right: 0.1.sw),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft:Radius.circular(8), ),
      ),
    );
  }
}
