import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/utils/routes/routes_name.dart';
import 'package:eassy_rokkad/view/add.dart/add_bill.dart';
import 'package:eassy_rokkad/view/screens/report_screen.dart';

import 'package:eassy_rokkad/view/tabbar_bills/tab1.dart';
import 'package:eassy_rokkad/view/tabbar_bills/tab2.dart';
import 'package:eassy_rokkad/view/view_report/purchase_report.dart';
import 'package:eassy_rokkad/view/view_report/view_report.dart';

import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
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
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(children: [
                SizedBox(
                  width: double.infinity,
                  height: height(context, 1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(context, 0.4),
                        child: Stack(
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.37,
                                    decoration:
                                        BoxDecoration(color: textColorblue),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: SizedBox(
                                    width: width(context, 1),
                                    height: 70,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.salesReport);
                                          },
                                          child: Container(
                                            width: width(context, 0.28),
                                            height: 62.0,
                                            decoration: BoxDecoration(
                                                color: textColorwhite,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '₹500',
                                                        style: TextStyle(
                                                          fontFamily: font,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 18.0,
                                                          color: textColorgreen,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Monthly Sales",
                                                        style: TextStyle(
                                                          fontFamily: 'poppins',
                                                          fontSize: 10.0,
                                                          color:
                                                              textColorlightgery,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: textColorblue,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.purchaseReport);
                                          },
                                          child: Container(
                                            width: width(context, 0.28),
                                            height: 62.0,
                                            decoration: BoxDecoration(
                                                color: textColorwhite,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            '₹0',
                                                            style: TextStyle(
                                                              fontFamily: font,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 18.0,
                                                              color:
                                                                  textColorred,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: width(
                                                                context, 0.125),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color:
                                                                textColorblue,
                                                            size: 15,
                                                          )
                                                        ],
                                                      ),
                                                      Text(
                                                        "Monthly Purchase",
                                                        style: TextStyle(
                                                          fontFamily: 'poppins',
                                                          fontSize: 10.0,
                                                          color:
                                                              textColorlightgery,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ReportScreen()));
                                          },
                                          child: Container(
                                            width: width(context, 0.28),
                                            height: 62.0,
                                            decoration: BoxDecoration(
                                                color: textColorwhite,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'View',
                                                        style: TextStyle(
                                                          fontFamily: font,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: textColorblack,
                                                        ),
                                                      ),
                                                      Text(
                                                        "Reports",
                                                        style: TextStyle(
                                                          fontFamily: 'poppins',
                                                          fontSize: 10.0,
                                                          color:
                                                              textColorlightgery,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.keyboard_arrow_right,
                                                  color: textColorblue,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                            Positioned(
                              child: SizedBox(
                                height: 60,
                                width: width(context, 0.45),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 5),
                                  child: Column(
                                    children: [
                                      Row(
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
                                              ...dropDownListData.map<
                                                      DropdownMenuItem<String>>(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '₹100',
                                            style: TextStyle(
                                              fontFamily: font,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: textColorblack,
                                            ),
                                          ),
                                          Text(
                                            "Today's in",
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10.0,
                                              color: textColorlightgery,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '₹1',
                                            style: TextStyle(
                                              fontFamily: font,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: textColorred,
                                            ),
                                          ),
                                          Text(
                                            "Today's out",
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10.0,
                                              color: textColorlightgery,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    cashBookButton()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      searchbar(),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width(context, 1),
                        height: 1.5,
                        decoration: BoxDecoration(
                          color: dividerColorgrey.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: const [Btab1(), Btab2()],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: width(context, 0.1),
                  right: width(context, 0.1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Material(
                      color: textColorblue,
                      child: TabBar(
                        controller: tabController,
                        labelColor: textColorblue,
                        indicatorColor: textColorwhite,
                        unselectedLabelColor: textColorwhite,
                        indicatorWeight: 3.0,
                        indicator: BoxDecoration(
                          color: textColorwhite,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: textColorwhite,
                            width: 1.0,
                          ),
                        ),
                        tabs: [
                          tab(
                              'Sale ',
                              // tabController.index == 0
                              //     ? ic_billtab2
                              // :
                              ic_billtab,
                              tabController.index == 0),
                          tab(
                              'Purchase',
                              // tabController.index == 1
                              //     ? ic_billtab2
                              //     :
                              ic_billtab,
                              tabController.index == 1),
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
      bottomNavigationBar: BottomAppBar(
        color: textColorwhite,
        surfaceTintColor: appBgColor,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 55,
                width: width(context, 0.39),
                decoration: BoxDecoration(
                  color: textColorwhite,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: textColorblue, width: 1.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      ic_billscreen,
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                              color: textColorblue,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Payments & Returns',
                          style: TextStyle(color: textColorblue, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width(context, 0.1),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: SizedBox(
                width: width(context, 0.4),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddBillScreen(),
                        ));
                  },
                  backgroundColor: textColorblue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt,
                        color: appBgColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'ADD BILL',
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
          ],
        ),
      ),
    );
  }

  Widget tab(String? label, String icontxt, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 3,
          ),
          Image.asset(
            key: UniqueKey(),
            icontxt,
            height: 15,
            width: 20,
            color: isSelected ? textColorblue : textColorwhite,
          ),
          Text(
            label!,
          )
        ],
      ),
    );
  }

  Widget cashBookButton() {
    return InkWell(
      onTap: () {},
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
              'Cashbook',
              style: TextStyle(
                fontFamily: font,
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

  Widget searchbar() {
    return Container(
      width: width(context, 0.9),
      height: height(context, 0.07),
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: dividerColorgrey.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search customer',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
