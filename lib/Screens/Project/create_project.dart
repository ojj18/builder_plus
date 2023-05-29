// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Component/Form/main.dart';
import 'package:builder_plus/Component/button/main.dart';
import 'package:builder_plus/Component/imagepicker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  String? _selectedCountry;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController clientName = TextEditingController();
  final TextEditingController projectsDetails = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController projectDuration = TextEditingController();
  final TextEditingController paymentTerms = TextEditingController();
  DateTime? _datePicker;

  //date function
  Future _selectDate(BuildContext context) async {
    _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: primaryColor),
              ),
            ),
            child: child!,
          );
        });
    if (_datePicker != null) {
      String formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(_datePicker!);

      setState(() {
        startDate.text = formattedDate;
        // _breakingNewsModel.date = formattedDate;
      });
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        centerTitle: true,
        title: const Text(
          "Projects",
          style: LightTheme.header,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 24,
            icon: const Icon(Icons.list),
          ),
        ],
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
                    Text(
                      'Project Detail',
                      style: LightTheme.subHeader8,
                    ),
                    ImagePickerButton()
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonFormField(
                  textController: clientName,
                  textAlign: TextAlign.start,
                  height: 52.0,
                  width: width,
                  labelText: 'Client Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonFormField(
                  textController: projectsDetails,
                  height: 90.0,
                  width: width,
                  labelText: 'Projects Details',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonFormField(
                  textController: startDate,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  suffixIcon: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage("assets/icons/calender.png"),
                    ),
                  ),
                  height: 52.0,
                  width: width,
                  labelText: 'Start Date',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonFormField(
                  textController: projectDuration,
                  height: 52.0,
                  width: width,
                  labelText: 'Project Duration',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CommonFormField(
                  textController: paymentTerms,
                  height: 52.0,
                  width: width,
                  labelText: 'Payment Terms',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: 52.0,
                  width: double.infinity,
                  child: DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    icon: Visibility(
                      visible: true,
                      child: Image(
                        image: AssetImage("assets/icons/dropdown-arrow.png"),
                        height: 20.0,
                        width: 20.0,
                      ),
                    ),
                    iconSize: 20.0,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: 'Select Quotation',
                      hintStyle: LightTheme.subHeader7,
                      counter: const SizedBox.shrink(),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'Quotation 1',
                        child: Text('Quotation 1'),
                      ),
                      DropdownMenuItem(
                        value: ' Quotation 2',
                        child: Text('Quotation 2'),
                      ),
                      DropdownMenuItem(
                        value: 'Quotation 3',
                        child: Text('Quotation 3'),
                      ),
                      DropdownMenuItem(
                        value: 'Quotation 4',
                        child: Text('Quotation 4'),
                      ),
                      DropdownMenuItem(
                        value: 'Quotation 5',
                        child: Text('Quotation 5'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedCountry = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select an option';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                CommonButton(
                  radius: 10,
                  height: 40,
                  width: 140.0,
                  gapWidth: 0,
                  fontSize: fontSize16,
                  buttonText: "Create Project",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
