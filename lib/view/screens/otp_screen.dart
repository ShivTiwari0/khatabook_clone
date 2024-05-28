// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:eassy_rokkad/view/screens/dashboard_screen.dart';
import 'package:eassy_rokkad/view/screens/home_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/utils/routes/routes_name.dart';

class OtpScreen extends StatefulWidget {
  String? number;
  OtpScreen({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int sec = 29;
  Timer? timer;
  bool isLoading = false;
  TextEditingController otpController = TextEditingController(text: "");

  var otpData;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (sec == 0) {
        timer.cancel();
        sec = 30;
        setState(() {});
      } else {
        setState(() {
          sec--;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

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
          Container(
            width: size.width,
            height: 63.0,
            color: const Color(0xff14456efe),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Image.asset(lock),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'OTP sent to ${widget.number}',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                        color: textColorgrey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Add your onPressed logic here
                      },
                      child: Text(
                        'Edit Number',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                          color: textColorblue,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Container(
              height: size.width * 0.125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: OtpTextField(
                handleControllers: (List<TextEditingController?> controllers) {
                  otpController = controllers[0]!;
                },
                onSubmit: (value) {
                  // otpData = value;
                  // if (value.length == 6) {
                  //   verify(context);
                  // }
                },
                fieldWidth: 40,
                numberOfFields: 6,
                enabled: true,
                showFieldAsBox: true,
                focusedBorderColor: borderColorgrey,
                enabledBorderColor: borderColorgrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(7),
                cursorColor: textColorblue,
                textStyle: TextStyle(
                  color: textColorgrey,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (sec > 0 && sec != 30)
                Text(
                  ' Resend OTP in ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    color: textColorgrey,
                  ),
                ),
              if (sec == 30)
                InkWell(
                  onTap: () {
                    startTimer();
                    // resentOtp();
                  },
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: font,
                      color: textColorblue,
                    ),
                  ),
                ),
              if (sec > 0 && sec != 30)
                Text(
                  '00:$sec',
                  style: TextStyle(
                    fontFamily: font,
                    color: textColorblue,
                    fontSize: 15,
                  ),
                ),
              if (sec > 0 && sec != 30)
                Text(
                  ' seconds ',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    color: textColorgrey,
                  ),
                ),
            ],
          ),
          Image.asset(enterotplogo),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const DashBoardScreen()),
                  (route) => false);
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
            child: const Text('Submit'),
          ),
        ]),
      ),
    );
  }
}
