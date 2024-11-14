import 'package:budget_planner/home/homepage.dart';
import 'package:budget_planner/route/routename.dart';
import 'package:flutter/material.dart';


class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      // case RoutesName.splash:
      //   return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());

      // case RoutesName.login:
      //   return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}