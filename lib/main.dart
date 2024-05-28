import 'package:eassy_rokkad/utils/routes/routes_name.dart';
import 'package:eassy_rokkad/utils/routes/routs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Map<int, Color> color = {
    50: const Color.fromRGBO(69, 110, 254, 0.1),
    100: const Color.fromRGBO(69, 110, 254, 0.2),
    200: const Color.fromRGBO(69, 110, 254, 0.3),
    300: const Color.fromRGBO(69, 110, 254, 0.4),
    400: const Color.fromRGBO(69, 110, 254, 0.5),
    500: const Color.fromRGBO(69, 110, 254, 0.6),
    600: const Color.fromRGBO(69, 110, 254, 0.7),
    700: const Color.fromRGBO(69, 110, 254, 0.8),
    800: const Color.fromRGBO(69, 110, 254, 0.9),
    900: const Color.fromRGBO(69, 110, 254, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Rokkad',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF456EFE, color),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.genrateRoute,
    );
  }
}
