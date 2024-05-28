import 'package:eassy_rokkad/res/common.dart';
import 'package:eassy_rokkad/res/themes/apptheme.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors_in_immutables, constant_identifier_names, camel_case_types, unnecessary_string_interpolations, prefer_typing_uninitialized_variables

import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

class AddProduct extends StatefulWidget {
  AddProduct({
    super.key,
    required this.isUpdate,
    // this.userDocs,
  });
  bool? isUpdate;
  // var userDocs;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController gst = TextEditingController();
  TextEditingController flat = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pinode = TextEditingController();
  TextEditingController city = TextEditingController(text: '0.0');
  TextEditingController state = TextEditingController();

  TextEditingController dt = TextEditingController();

  void submit(BuildContext context) {
    final valid = form.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (valid) {
      form.currentState!.save();
      loadingWidget(context, 'Saving user details');
      // if (widget.isUpdate == true) {
      //   updateUser(context);
      // } else {
      //   saveUser(context);
      // }
    }
  }

  List<String> to = ['0', '1'];

  List<String> heading = ['Customer', 'Supplier'];

  var selected;

  // initData() {
  //   if (widget.isUpdate == true) {
  //     name.text = widget.userDocs['customerName'];
  //     fname.text = widget.userDocs['fatherName'];
  //     gname.text = widget.userDocs['guaranterName'];
  //     mno.text = widget.userDocs['contactNumber'];
  //     wno.text = widget.userDocs['whatsappNumber'];
  //     ano.text = widget.userDocs['aadharNumber'];
  //     address.text = widget.userDocs['customerAddress'];
  //     baddress.text = widget.userDocs['billingAddress'];
  //   }
  // }

  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    // initData();
    selected = to[0];
    dt.text = DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        title: Text(
          'Create Customer',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColorblack,
              fontFamily: font),
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: iconColorblack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(15),
        child: Form(
          key: form,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(
                            label: 'Party Name ',
                            icon: Icons.person,
                            suffix: null),
                        controller: name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Enter valid m.no , length should be 10';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(
                            label: 'Customer contact number',
                            icon: Icons.phone,
                            suffix: null),
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        controller: mobile,
                      ),
                      if (widget.isUpdate == false)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Who are they ?',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: font,
                                  fontWeight: FontWeight.w400,
                                  color: textColorgrey),
                            ),
                            for (int x = 0; x < 2; x++)
                              Row(
                                children: [
                                  Radio(
                                      value: to[x],
                                      groupValue: selected,
                                      activeColor: textColorblue,
                                      onChanged: (value) {
                                        setState(() {
                                          selected = value;
                                        });
                                      }),
                                  Text(
                                    heading[x],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: font,
                                        fontWeight: FontWeight.w500,
                                        color: textColorblack),
                                  )
                                ],
                              ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ADD GSTIN & ADDRESS (OPTIONAL)',
                          style: TextStyle(
                            fontFamily: 'poppins_medium',
                            fontSize: 14.0,
                            color: textColorblue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // validator: (value) {
                        //   if(value!.isEmpty||value.length<10){
                        //     return 'Enter valid m.no , length should be 10';
                        //   }
                        //   return null;
                        // },

                        decoration: textFieldDecoration(
                            label: 'GSTIN', icon: Icons.receipt, suffix: null),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        controller: gst,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid permanent address';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration(
                            label: 'Flat/Building Number',
                            icon: Icons.location_pin,
                            suffix: null),
                        controller: flat,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: textFieldDecoration(
                            label: 'Area /Locality',
                            icon: Icons.location_pin,
                            suffix: null),
                        controller: area,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: textFieldDecoration(
                            label: 'Pin Code', icon: Icons.pin, suffix: null),
                        controller: pinode,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: textFieldDecoration(
                                  label: 'City', icon: Icons.location_city),
                              controller: city,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: state,
                              decoration: textFieldDecoration(
                                  label: 'State', icon: Icons.location_on),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height(context, 0.1),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: textColorblue,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
            fixedSize: Size(width(context, 0.85), 50.0),
          ),
          child: const Text('Get OTP'),
        ),
        //  Row(
        //   children: [
        //     Expanded(
        //       child: InkWell(
        //         onTap: () {
        //           Navigator.of(context).pop();
        //         },
        //         child: Container(
        //           alignment: Alignment.center,
        //           color: buttonColorwhite,
        //           child: Text(
        //             'Cancel',
        //             style: TextStyle(
        //                 color: textColorblack, fontFamily: font, fontSize: 14),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: InkWell(
        //         onTap: () {
        //           submit(context);
        //         },
        //         child: Container(
        //           alignment: Alignment.center,
        //           color: buttonColorblue,
        //           child: Text(
        //             widget.isUpdate == true ? 'Update' : 'Save',
        //             style: TextStyle(
        //                 color: textColorwhite, fontFamily: font, fontSize: 14),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
