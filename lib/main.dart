 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
 import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tu_kar/services/routes/routes.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view.dart';
import 'package:tu_kar/ui/screens/add_contacts_groups/add_contacts_groups_view_model.dart';
import 'package:tu_kar/ui/screens/assign_task/assign_task_view.dart';
import 'package:tu_kar/ui/screens/assign_task/assign_task_view_model.dart';
import 'package:tu_kar/ui/screens/introduction_screens/introduction_view.dart';
import 'package:tu_kar/ui/screens/main_page/main_page_view.dart';
import 'package:tu_kar/ui/screens/main_page/main_page_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/home/home_view_model.dart';
import 'package:tu_kar/ui/screens/main_page/tabs/profile/profile_view_model.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/onboarding_view.dart';
import 'package:tu_kar/ui/screens/onboarding_screens/onboarding_view_model.dart';
import 'package:tu_kar/ui/screens/sign_in_up/sign_in_up_view.dart';
import 'package:tu_kar/ui/screens/sign_in_up/sign_in_up_view_model.dart';


import 'package:tu_kar/utils/styles/app_themes.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  // final routeObserver = MyRouteObserver();
  // final blocObserver = MyBlocObserver();
  // FirebaseAuth.instance
  //     .signOut();
  // // Register the custom BLoC observer
  // Bloc.observer = blocObserver;
  runApp(
    MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInUpViewModel()),
        ChangeNotifierProvider(create: (_)=> AddContactsGroupsViewModel()),
        ChangeNotifierProvider(create: (_)=> AssignTaskViewModel()),
        ChangeNotifierProvider(create: (_)=> OnboardingViewModel()),
        // BlocProvider<AuthBloc>(
        //   create: (context) => AuthBloc()..add(AuthObserve()),
        // ),
        // BlocProvider(
        //   create: (context) => NetworkBloc()..add(NetworkObserve()),
        // ),
        // Add more BlocProviders as needed
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return  const App();
          }),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

//  final MyRouteObserver routeObserver;
//  const App({Key? key, required this.routeObserver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   //   navigatorObservers: [routeObserver],
        theme: AppTheme.lightTheme, // Use the light theme
        darkTheme: AppTheme.darkTheme,
    // home: const AssignTaskView(name: "Aditya Shukla",),
   // home: const AddContactsGroupsView(isGroup: false,),
    //  home: SignInUpView(isSignUp: false,),
     // home: OnboardingView(isEmail:false),
      home:IntroScreenDemo(),
      onGenerateRoute: Routes.generateRoutes,
      // home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      //   if (state is AuthSuccess) {
      //     return BlocBuilder<NetworkBloc, NetworkState>(
      //       builder: (context, state) {
      //         if (state is NetworkFailure) {
      //           return const Text("No Internet Connection,authenticated");
      //         } else if (state is NetworkSuccess) {
      //           return const HomeView();
      //         } else {
      //           return const CircularProgressIndicator();
      //         }
      //       },
      //     );
      //   } else {
      //     return BlocBuilder<NetworkBloc, NetworkState>(
      //       builder: (context, state) {
      //         if (state is NetworkFailure) {
      //           return const Text("No Internet Connection, non authenticated");
      //         } else if (state is NetworkSuccess) {
      //           return UserOnboarding();
      //         } else {
      //           return const CircularProgressIndicator();
      //         }
      //       },
      //     );
      //   }
      // }),
    );
  }
}
// import 'package:flutter/material.dart';
//
// void main() {
//     // String original = "hello";
//     // String reversed = reverseString(original);
//     // print(reversed);
//   print(sumOfEvenNumbers([9,6,4,12,19,2,5,0,3,4]));
// // print(countCharOccurrences("wabulabadubdub"));
// print(isPalindrome("fxff"));
//   runApp(const MyApp());
// }
//
// Map<String, int> countCharOccurrences(String input) {
//   Map<String, int> occurrences = {};
//   for (String char in input.split('')) {
//     print(char);
//     print(occurrences[char]);
//     occurrences[char] = (occurrences[char] ?? 0) + 1;
//     print(occurrences);
//   }
//   return occurrences;
// }
//
// bool isPalindrome(String w){
//   String rev= w.split("").reversed.join("");
//   return rev==w;
// }
//
//
// int findLargest(List<int> numbers) {
//   return numbers.reduce((current, next) => current > next ? current : next);
// }
//
// // int findLargest(List<int> list){
// //   int greatest = list[0];
// //   for (var element in list) { if(element>list[0]){
// //     greatest = element;
// //   }}
// //   return greatest;
// // }
//
// List<int> fibonacci(int n) {
//   List<int> sequence = [0, 1];
//   for (int i = 2; i < n; i++) {
//     sequence.add(sequence[i - 1] + sequence[i - 2]);
//     print(sequence);
//   }
//   return sequence;
// }
//
// Stream<int> numberSequenceStream(int maxNumber) async* {
//   for (int i = 1; i <= maxNumber; i++) {
//     await Future.delayed(Duration(seconds: 1)); // Simulate some delay
//     yield i; // Emit each number with a delay
//   }
// }
//
// bool isPrime(int n){
//   for(int i= 2;i<n/2;i++)
//     {
//       if(n%i==0)
//         {
//           return false;
//         }
//     }
//   return true;
// }
//
// int sumOfEvenNumbers(List<int> numbers) {
//   return numbers.where((number) => number.isEven).reduce((sum, current) => sum + current);
// }
//
// String reverseString(String input) {
//   print(input.split('').reversed.join(''));
//   return input.split('').reversed.join('');
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SnackBar Demo'),
//         ),
//         body: const SnackBarDemo(),
//       ),
//     );
//   }
// }
//
// class SnackBarDemo extends StatelessWidget {
//   const SnackBarDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             content: const Text('Hello! This is a SnackBar.'),
//             action: SnackBarAction(
//               label: 'Undo',
//               onPressed: () {
//                 // Code to execute when the action button is pressed
//                 // For example, undoing an action
//               },
//             ),
//             duration: const Duration(seconds: 5), // Adjust the duration as needed
//           );
//
//           // Find the Scaffold in the widget tree and use it to show the SnackBar
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: const Text('Show SnackBar'),
//       ),
//     );
//   }
// }
//


