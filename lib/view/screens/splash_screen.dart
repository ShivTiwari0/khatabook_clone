import 'package:eassy_rokkad/utils/common.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/utils/routes/routes_name.dart';
import 'package:eassy_rokkad/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  jump() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesName.login);
    });
  }

  @override
  void initState() {
    super.initState();
    jump();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    splashbk,
                    fit: BoxFit.fill,
                    height: size.height * 0.95,
                    width: size.width,
                  ),
                  Positioned(
                      top: size.height * 0.34,
                      left: size.width * 0.18,
                      child: Image.asset(
                        appIcon,
                        height: height(context, 0.15),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
