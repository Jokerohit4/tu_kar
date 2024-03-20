import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/ui/screens/main_page/main_page_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/costing/costing_view.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/notifications/notifications_view.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/profile/profile_view.dart';

import 'package:tu_kar/utils/constants/app_colors.dart';

class MainPageView extends StatelessWidget {
  MainPageView({super.key});

  final List<Widget> pages = [
    const HomePageView(),
    const NotificationsView(),
    const CostingView(),
    const CostingView(),
    const ProfileView(),
  ];

  final List<BottomNavigationBarItem> navigationItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.notifications_rounded), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.view_list), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video_sharp), label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainPageViewModel>();

    return SafeArea(
        child: Scaffold(
      body: pages[viewModel.currentIndex],
      floatingActionButton: viewModel.currentIndex == 0
            ? FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => viewModel.goToAddContactsGroups(context),
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add,weight: 1000,),
      )
      : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: navigationItems,
        currentIndex: viewModel.currentIndex,
        onTap: (index) => viewModel.selectIndex(index),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    ));
  }
}
