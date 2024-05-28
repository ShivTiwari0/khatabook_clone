import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/res/themes/assets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddBillScreen extends StatefulWidget {
  const AddBillScreen({super.key});

  @override
  State<AddBillScreen> createState() => _AddBillScreenState();
}

class _AddBillScreenState extends State<AddBillScreen> {
  TextEditingController dt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('date ::::${dt.text}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sale Bill',
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
              height: height(
                context,
                0.1,
              ),
              width: width(context, 1),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5), color: textColorwhite),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 15, top: 8, bottom: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sale Bill Number',
                          style: TextStyle(
                              color: textColorlightgery,
                              fontFamily: font,
                              fontSize: 13),
                        ),
                        const Text(
                          '3',
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: width(context, 0.2),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: textColorlightgery,
                                  fontFamily: font,
                                  fontSize: 13),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  var date1 = await datePicker(context);
                                  dt.text =
                                      DateFormat('dd/MM/yyyy').format(date1);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width:
                                          1.0, // Adjust border width if needed
                                      color: Colors.black.withOpacity(
                                          0.3), // Adjust border color
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0), // Adjust vertical padding
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
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: font,
                                          color: textColorblack,
                                          decorationColor: textColorblack),
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: 20.0,
                                        color: textColorblack.withOpacity(0.7),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: dt,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width(context, 1),
              height: height(context, 0.19),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0, // Adjust border width if needed
                  color: Colors.black.withOpacity(0.3), // Adjust border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bill to',
                      style: TextStyle(
                          color: textColorlightgery,
                          fontFamily: font,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    searchbar(context, 'Search From Your Parties', search),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            color: textColorblue,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'ADD NEW PARTY',
                            style: TextStyle(
                              fontFamily: font,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: textColorblue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width(context, 1),
              height: height(context, 0.19),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0, // Adjust border width if needed
                  color: Colors.black.withOpacity(0.3), // Adjust border color
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Items',
                      style: TextStyle(
                          color: textColorlightgery,
                          fontFamily: font,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    searchbar(
                        context, 'Enter Items froms your inventries', cube),
                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            color: textColorblue,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'ADD NEW ITEM',
                            style: TextStyle(
                              fontFamily: font,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              color: textColorblue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
