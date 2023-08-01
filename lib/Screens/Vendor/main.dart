import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Component/Form/main.dart';
import 'package:builder_plus/Component/button/main.dart';
import 'package:builder_plus/Component/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../helper/models/vendorModel/main.dart';
import '../../helper/sqlite/db_helper.dart';
import '../../route/main.dart';

String vendorTable = "vendor_table";

class CreateVendorScreen extends StatefulWidget {
  const CreateVendorScreen({super.key});

  @override
  State<CreateVendorScreen> createState() => _CreateVendorScreenState();
}

class _CreateVendorScreenState extends State<CreateVendorScreen> {
//  String? _selectedCountry;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController vendorName = TextEditingController();
  final TextEditingController mobileNumber1 = TextEditingController();
  final TextEditingController mobileNumber2 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController catergory = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();

  VendorModel vendorModel = VendorModel();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(RouteSetting.bottomNav);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 24,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Add Vendor",
            style: LightTheme.header,
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     iconSize: 24,
          //     icon: const Icon(Icons.list),
          //   ),
          // ],
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Vendor Detail',
                        style: LightTheme.subHeader8,
                      ),
                      ImagePickerButton()
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CommonFormField(
                    textController: vendorName,
                    textAlign: TextAlign.start,
                    height: 52.0,
                    width: width,
                    labelText: 'Vendor Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    onSave: (value) {
                      vendorName.text = value!;
                    },
                    onError: (value) {
                      if (value.isEmpty) {
                        return "This is required field";
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CommonFormField(
                    keyboardType: TextInputType.phone,
                    textController: mobileNumber1,
                    height: 52.0,
                    width: width,
                    labelText: 'Mobile No 1',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    onSave: (value) {
                      mobileNumber1.text = value!;
                    },
                    onError: (value) {
                      if (value.isEmpty) {
                        return "This is required field";
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CommonFormField(
                    keyboardType: TextInputType.phone,
                    textController: mobileNumber2,
                    height: 52.0,
                    width: width,
                    labelText: 'Mobile No 2',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    onSave: (value) {
                      mobileNumber2.text = value!;
                    },
                    onError: (value) {
                      if (value.isEmpty) {
                        return "This is required field";
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CommonFormField(
                    textController: address,
                    height: 52.0,
                    width: width,
                    labelText: 'Address',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    onSave: (value) {
                      address.text = value!;
                    },
                    onError: (value) {
                      if (value.isEmpty) {
                        return "This is required field";
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  CommonFormField(
                    textController: catergory,
                    height: 52.0,
                    width: width,
                    labelText: 'Category',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    onSave: (value) {
                      catergory.text = value!;
                    },
                    onError: (value) {
                      if (value.isEmpty) {
                        return "This is required field";
                      }
                    },
                  ),

                  // SizedBox(
                  //   height: 52.0,
                  //   width: double.infinity,
                  //   child: DropdownButtonFormField<String>(
                  //     value: _selectedCountry,
                  //     icon: const Visibility(
                  //       visible: true,
                  //       child: Image(
                  //         image: AssetImage("assets/icons/dropdown-arrow.png"),
                  //         height: 20.0,
                  //         width: 20.0,
                  //       ),
                  //     ),
                  //     iconSize: 20.0,
                  //     decoration: const InputDecoration(
                  //       contentPadding: EdgeInsets.all(10.0),
                  //       hintText: 'Select Quotation',
                  //       hintStyle: LightTheme.subHeader7,
                  //       counter: SizedBox.shrink(),
                  //       errorBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: Colors.redAccent,
                  //         ),
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: textFieldBorderColor,
                  //         ),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: textFieldBorderColor,
                  //         ),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: textFieldBorderColor,
                  //         ),
                  //       ),
                  //     ),
                  //     items: const [
                  //       DropdownMenuItem(
                  //         value: '1 BHk Flat',
                  //         child: Text('1 BHk Flat'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: '2 BHk Flat',
                  //         child: Text('2 BHk Flat'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: '3 BHk Flat',
                  //         child: Text('3 BHk Flat'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: '4 BHk Flat',
                  //         child: Text('4 BHk Flat'),
                  //       ),
                  //       DropdownMenuItem(
                  //         value: '5 BHk Flat',
                  //         child: Text('5 BHk Flat'),
                  //       ),
                  //     ],
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _selectedCountry = value!;
                  //       });
                  //     },
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please select an option';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CommonButton(
                    radius: 10,
                    height: 40,
                    width: 140.0,
                    gapWidth: 0,
                    fontSize: fontSize16,
                    buttonText: "Create Vendor",
                    onButtonTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      _save();

                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _save() async {
    vendorModel.vendorName = vendorName.text;
    vendorModel.mobileNumber1 = mobileNumber1.text;
    vendorModel.mobileNumber2 = mobileNumber2.text;
    vendorModel.vendorAddress = address.text;
    vendorModel.category = catergory.text;
    vendorModel.vendorCreatedDate = DateFormat.yMMMd().format(DateTime.now());

    int? result;

    result = await databaseHelper.insertTodo(vendorModel, vendorTable);

    if (result != 0) {
      // Success
    } else {
      // Failure
    }
  }
}
