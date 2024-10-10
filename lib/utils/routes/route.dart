// import 'package:flutter/material.dart';
// import 'package:ivy/screens/login_screen.dart';
// import 'package:ivy/utils/routes/routes_name.dart';
// import 'package:ivy/view/signUp_view.dart';
// import 'package:ivy/view/splash/splash_screen.dart';
// import 'package:ivy/view/ui/home/Home_screen.dart';

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RoutesName.splash:
//         return MaterialPageRoute(
//             builder: (BuildContext context) => const SplashScreen());
//       case RoutesName.home:
//         return MaterialPageRoute(
//             builder: (BuildContext context) => const HomeScreen());
//       case RoutesName.login:
//         return MaterialPageRoute(
//             builder: (BuildContext context) => LoginScreen());
//       case RoutesName.signUp:
//         return MaterialPageRoute(
//             builder: (BuildContext context) => const SignupView());
//       default:
//         return MaterialPageRoute(builder: (_) {
//           return const Scaffold(
//             body: Center(
//               child: Text('No routes defined'),
//             ),
//           );
//         });
//     }
//   }
// }
