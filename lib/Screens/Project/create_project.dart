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
//  String? _selectedCountry;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController clientName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
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
              colorScheme: const ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: primaryColor),
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
        title: const Text(
          "Projects",
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
                  textController: phoneNumber,
                  height: 52.0,
                  width: width,
                  labelText: 'Mobile no',
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
                    padding: const EdgeInsets.all(12.0),
                    child: const Image(
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
                  textController: paymentTerms,
                  height: 52.0,
                  width: width,
                  labelText: 'Project value',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                  CommonFormField(
                  textController: paymentTerms,
                  height: 52.0,
                  width: width,
                  labelText: 'Location',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                const CommonButton(
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
