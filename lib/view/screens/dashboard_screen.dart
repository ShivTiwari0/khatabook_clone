import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/view/screens/bills_screen.dart';
import 'package:eassy_rokkad/view/screens/home_screeen.dart';

import 'package:eassy_rokkad/view/screens/more_screen.dart';
import 'package:eassy_rokkad/view/screens/report_screen.dart';
import 'package:eassy_rokkad/view/screens/items_screen.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int mCurrentIndex = 0;
  int mSelectedIndex = 0;
  final t = <Widget>[
    const HomeScreen(),
    const BillScreen(),
    const ItemsScreen(),
    const ReportScreen(),
    const MoreScreen(),
  ];

  List<String> title = ['Party', 'Bills', 'Items', 'Reports', 'More'];

  List<String> icon = [ic_party, ic_bills3, ic_items, ic_report, ic_more];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        toolbarHeight: 3,
      ),
      body: Container(
        child: t.elementAt(mSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        enableFeedback: false,
        backgroundColor: textColorwhite,
        currentIndex: mSelectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: textColorblue,
        onTap: (index) {
          mSelectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                ic_party,
                color: Colors.grey,
                height: 24,
              ),
              activeIcon: Image.asset(
                ic_party,
                color: textColorblue,
                height: 24,
              ),
              label: 'Party'),
          BottomNavigationBarItem(
              icon: Image.asset(
                ic_bills3,
                color: Colors.grey,
                height: 24,
              ),
              activeIcon: Image.asset(
                ic_bills3,
                color: textColorblue,
                height: 24,
              ),
              label: ' Bills'),
          BottomNavigationBarItem(
              icon: Image.asset(
                ic_items,
                color: Colors.grey,
                height: 24,
              ),
              activeIcon: Image.asset(
                ic_items,
                color: textColorblue,
                height: 24,
              ),
              label: 'Items'),
          BottomNavigationBarItem(
              icon: Image.asset(
                ic_report,
                color: Colors.grey,
                height: 24,
              ),
              activeIcon: Image.asset(
                ic_report,
                color: textColorblue,
                height: 24,
              ),
              label: 'Report'),
          BottomNavigationBarItem(
              icon: Image.asset(
                ic_more,
                color: Colors.grey,
                height: 24,
              ),
              activeIcon: Image.asset(
                ic_more,
                color: textColorblue,
                height: 24,
              ),
              label: 'More'),
        ],
      ),
    );
  }
}
