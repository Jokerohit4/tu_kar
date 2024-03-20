


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tu_kar/services/routes/route_arguments.dart';
import 'package:tu_kar/services/routes/route_transistions.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/main_page_view.dart';
import 'package:tu_kar/ui/screens/main_page/main_page_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/costing/costing_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/notifications/notifications_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/profile/profile_view_model.dart';
import 'package:tu_kar/ui/screens/settings/settings_view.dart';
import 'package:tu_kar/ui/screens/settings/settings_view_model.dart';




///guides the routes and allows named routing
class Routes{


  static const String settingsViewRoute = "/settingsViewRoute";
  static const String addContactsGroupsViewsRoute = "/addContactsGroupsViewsRoute";
  static const String mainViewRoute = "/mainViewRoute";



  static Route<dynamic>? generateRoutes(RouteSettings? settings) {
    switch (settings!.name) {


      case addContactsGroupsViewsRoute:
        var args = settings.arguments as AddGroupFriendRouteArguments;
        return FadeRoute(
          page: ChangeNotifierProvider(
            create: (context) => AddContactsGroupsViewModel(),
            child: AddContactsGroupsView(isGroup: args.isGroup,),
          ),
        );


      case mainViewRoute:
        return FadeRoute(
          page: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=> MainPageViewModel()),
              ChangeNotifierProvider(create: (_)=> HomePageViewModel()),
              ChangeNotifierProvider(create: (_)=> ProfileViewModel()),
              ChangeNotifierProvider(create: (_)=> CostingViewModel()),
              ChangeNotifierProvider(create: (_)=> NotificationsViewModel()),
            ],
            child: MainPageView(),
          ),
        );

      case settingsViewRoute:
        return FadeRoute(
          page: ChangeNotifierProvider(
            create: (context) => SettingsViewModel(),
            child:  const SettingsView()
          ),
        );


      default:
        return FadeRoute(
          page: const Scaffold(
            body: Center(
              child: Text(
                'No route defined',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
    }
  }
  }