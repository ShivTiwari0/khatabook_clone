import 'package:eassy_rokkad/utils/routes/routes_name.dart';

import 'package:eassy_rokkad/view/screens/dashboard_screen.dart';
import 'package:eassy_rokkad/view/screens/home_screeen.dart';
import 'package:eassy_rokkad/view/screens/login_screen.dart';

import 'package:eassy_rokkad/view/screens/splash_screen.dart';
import 'package:eassy_rokkad/view/view_report/purchase_report.dart';
import 'package:eassy_rokkad/view/view_report/sales_report.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashBoardScreen());
      // case RoutesName.addParty:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => AddParty(
      //             isUpdate: null,
      //           ));
      case RoutesName.purchaseReport:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PurchaseReport());
      case RoutesName.salesReport:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SalesReport());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route Defined'),
            ),
          );
        });
    }
  }
}
