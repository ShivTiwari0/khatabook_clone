import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/utils/routes/routes_name.dart';
import 'package:eassy_rokkad/view/add.dart/add_party.dart';
import 'package:eassy_rokkad/view/screens/report_screen.dart';
import 'package:eassy_rokkad/view/tabbarpage_party/tab1.dart';
import 'package:eassy_rokkad/view/tabbarpage_party/tab2.dart';
import 'package:eassy_rokkad/view/view_report/view_report.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List dropDownListData = [
    {"title": "Manoj Prasad", "value": "1"},
    {"title": "Lucky", "value": "2"}
  ];
  String defaultValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: height(context, 1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(context, 0.325),
                        child: Stack(
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration:
                                        BoxDecoration(color: textColorblue),
                                  ),
                                ],
                              ),
                            ),
                            // TabBar

                            Positioned(
                              child: SizedBox(
                                height: 60,
                                width: width(context, 0.5),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        home_top,
                                        height: 35,
                                      ),
                                      SizedBox(
                                        width: width(context, 0.01),
                                      ),
                                      DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        value: "",
                                        menuMaxHeight: 300,
                                        items: [
                                          DropdownMenuItem(
                                            value: "",
                                            child: Text(
                                              'Manoj Prasad',
                                              style: TextStyle(
                                                  color: textColorwhite),
                                            ),
                                          ),
                                          ...dropDownListData
                                              .map<DropdownMenuItem<String>>(
                                                  (data) {
                                            return DropdownMenuItem(
                                              value: data['value'],
                                              child: Text(
                                                data['title'],
                                              ),
                                            );
                                          })
                                        ],
                                        onChanged: (value) {},
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: textColorwhite,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: height(context, 0.18),
                              left: width(context, 0.06),
                              child: Container(
                                width: width(context, 0.88),
                                height: 79.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      ic_home,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '₹0',
                                            style: TextStyle(
                                              fontFamily: 'poppins_semibold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: Color(0xFF333333),
                                            ),
                                          ),
                                          Text(
                                            'You will give',
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10.0,
                                              color: Color(0xFFA0A0A0),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Image.asset(
                                      ic_home1,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '₹100',
                                            style: TextStyle(
                                              fontFamily: 'poppins_semibold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: Color(0xFF333333),
                                            ),
                                          ),
                                          Text(
                                            'You will give',
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10.0,
                                              color: Color(0xFFA0A0A0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    reportButton()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      searchbar(context, 'Add Customer', search),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const [Tab1(), Tab2()],
                        ),
                      )
                    ],
                  ),
                ), //tabbar
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: width(context, 0.1),
                  right: width(context, 0.1),
                  child: Container(
                    color: textColorblue,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Material(
                      color: textColorblue,
                      child: TabBar(
                        controller: tabController,
                        labelColor: textColorwhite,
                        indicatorColor: textColorwhite,
                        indicatorWeight: 2.0,
                        indicator: BoxDecoration(
                          color: textColorblue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: textColorwhite,
                            width: 1.0,
                          ),
                        ),
                        tabs: [
                          tab('Customers', ic_custmor),
                          tab('Suppliers', ic_handup)
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius:
            BorderRadius.circular(30.0), // Adjust the radius as needed
        child: SizedBox(
          width: width(context, 0.7),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddParty(isUpdate: false),
                  ));
            },
            backgroundColor: textColorblue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: textColorwhite,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add Customer',
                  style: TextStyle(
                    fontFamily: font,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: appBgColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget tab(String? label, String icontxt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 3,
          ),
          Image.asset(
            icontxt,
            height: 20,
            width: 20,
          ),
          Text(
            label!,
            style: TextStyle(color: textColorwhite),
          )
        ],
      ),
    );
  }

  Widget reportButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReportScreen()));
      },
      child: Container(
        width: 74,
        height: 20,
        decoration: BoxDecoration(
          color: textColorblue,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              'View Report',
              style: TextStyle(
                fontFamily: 'Poppins_SemiBold',
                fontWeight: FontWeight.normal,
                fontSize: 9,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
