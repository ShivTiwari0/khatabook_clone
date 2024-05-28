import 'package:flutter/material.dart';
import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/view/add.dart/add_party.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  TextEditingController dt1 = TextEditingController();
  TextEditingController dt2 = TextEditingController();

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

  String defaultValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Report',
          style: TextStyle(
              fontFamily: font,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: textColorwhite),
        ),
        backgroundColor: textColorblue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(color: textColorblue),
              child: Column(
                children: [
                  Container(
                    width: width(context, 0.9),
                    height: height(context, 0.09),
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              var date1 = await datePicker(context);
                              dt1.text = DateFormat('dd/MM/yyyy').format(date1);
                              setState(() {});
                            },
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter opening balance';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Start Date',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: font,
                                    color: textColorblack.withOpacity(0.7)),
                                icon: const Icon(Icons.calendar_month),
                              ),
                              keyboardType: TextInputType.number,
                              controller: dt1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              var date2 = await datePicker(context);
                              dt2.text = DateFormat('dd/MM/yyyy').format(date2);
                              setState(() {});
                            },
                            child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter opening balance';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: 'End Date',
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: font,
                                      color: textColorblack.withOpacity(0.7)),
                                  icon: const Icon(Icons.calendar_month),
                                  suffix: null),
                              keyboardType: TextInputType.number,
                              controller: dt2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customsearchbar(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Net Balance',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: width(context, 0.19),
                  ),
                  Text(
                    '₹5,000',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        fontFamily: font,
                        color: textColorred),
                  )
                ],
              ),
            ),
            const Divider()
          ],
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox(
          width: width(context, 0.9),
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
                  Icons.file_copy,
                  color: textColorwhite,
                ),
                const SizedBox(width: 8),
                Text(
                  'Download',
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

  Widget customsearchbar(BuildContext context) {
    return Container(
      width: width(context, 0.9),
      height: height(context, 0.09),
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: textColorwhite,
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
