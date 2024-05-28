import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:eassy_rokkad/view/screens/dialougeboxes/purchacedia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class PurchaseReport extends StatefulWidget {
  const PurchaseReport({super.key});

  @override
  State<PurchaseReport> createState() => _PurchaseReportState();
}

class _PurchaseReportState extends State<PurchaseReport> {
  String? _selectedItem;

  TextEditingController dt1 = TextEditingController();
  TextEditingController dt2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColorgrey,
      appBar: AppBar(
        title: Text(
          'Purchase Report',
          style: TextStyle(
              fontFamily: font,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: textColorwhite),
        ),
        backgroundColor: textColorblue,
        iconTheme: IconThemeData(color: textColorwhite),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 7,
                ),
                InkWell(
                  onTap: () {
                    _showmultiDialouge();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width(context, 0.3),
                      height: 50,
                      decoration: BoxDecoration(
                          color: appBgColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(_selectedItem ?? 'Today'),
                          Icon(
                            Icons.arrow_drop_down,
                            color: textColorblue,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      var date1 = await showDatePickerDialog(
                          context: context,
                          initialDate: DateTime.now(),
                          minDate: DateTime(1950, 1, 1),
                          maxDate: DateTime(2100, 12, 31));

                      dt1.text = DateFormat('dd/MM/yy').format(date1!);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: width(context, 0.3),
                      decoration: BoxDecoration(
                          color: textColorwhite,
                          borderRadius: BorderRadius.circular(6)),
                      child: TextFormField(
                        enabled: false,
                        readOnly: true,
                        style: TextStyle(fontSize: 13, color: textColorgrey),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter opening balance';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Start Date',
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: font,
                              color: textColorblack),
                          icon: Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: textColorblue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        controller: dt1,
                      ),
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
                      dt2.text = DateFormat('dd/MM/yy').format(date2);
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: width(context, 0.3),
                      decoration: BoxDecoration(
                          color: textColorwhite,
                          borderRadius: BorderRadius.circular(6)),
                      child: TextFormField(
                        style: TextStyle(fontSize: 13, color: textColorgrey),
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
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: font,
                              color: textColorblack),
                          icon: Icon(
                            Icons.calendar_month,
                            size: 18,
                            color: textColorblue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        controller: dt2,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showmultiDialouge() async {
    final List<String> items = [
      'This Year',
      'This Quater',
      'This Month',
      'Last Month',
      'This Week',
      'Yesterday',
      'Today'
    ];
    final String? result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return PurchaseDiaBox(items: items);
        });
    if (result != null) {
      setState(
        () {
          _selectedItem = result;
        },
      );
    }
  }
}
