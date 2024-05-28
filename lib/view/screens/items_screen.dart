import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:eassy_rokkad/view/add.dart/add_product.dart';
import 'package:eassy_rokkad/view/tabbar_item/tab1.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen>
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
                        height: height(context, 0.323),
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
                                width: 200,
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
                                            '₹0',
                                            style: TextStyle(
                                              fontFamily: 'poppins_semibold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: textColorblack,
                                            ),
                                          ),
                                          Text(
                                            'Total Stock Value',
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
                                            '1',
                                            style: TextStyle(
                                              fontFamily: 'poppins_semibold',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0,
                                              color: textColorred,
                                            ),
                                          ),
                                          Text(
                                            'Low Stock Item',
                                            style: TextStyle(
                                              fontFamily: 'poppins',
                                              fontSize: 10.0,
                                              color: textColorlightgery,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    reportButton()
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
                          children: const [ITab1(), ITab1()],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: width(context, 0.1),
                  right: width(context, 0.1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Material(
                      color: textColorblue,
                      child: TabBar(
                        controller: tabController,
                        labelColor: textColorwhite,
                        indicatorColor: textColorwhite,
                        indicatorWeight: 3.0,
                        indicator: BoxDecoration(
                          color: textColorblue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: textColorwhite,
                            width: 1.0,
                          ),
                        ),
                        tabs: [
                          tab('Products', cube),
                          tab('Services', services)
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
          width: width(context, 0.5),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProduct(isUpdate: false),
                  ));
            },
            backgroundColor: textColorblue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  cube,
                  height: 30,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add Product',
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
            height: 15,
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
              'View Report',
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
