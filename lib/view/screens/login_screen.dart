import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/view/screens/otp_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(appIcon2),
        ),
        leadingWidth: size.width * 0.3,
        backgroundColor: textColorblue,
        toolbarHeight: 85.0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: 'Mobile Number',
                hintStyle: TextStyle(color: textColorblue, fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColorblue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: textColorblue),
                ),
                prefixText: '+91',
                prefixStyle: TextStyle(color: textColorblack, fontSize: 17),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
              ),
            ),
          ),
          Image.asset(loginimage1),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OtpScreen(
                            number: phoneController.text,
                          )));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: textColorblue,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
              ),
              fixedSize: Size(size.width * 0.85, 50.0),
            ),
            child: const Text('Get OTP'),
          ),
        ]),
      ),
    );
  }
}
