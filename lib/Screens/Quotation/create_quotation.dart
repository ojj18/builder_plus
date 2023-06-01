import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Component/Form/main.dart';
import 'package:flutter/material.dart';

class CreateQuotationScreen extends StatefulWidget {
  const CreateQuotationScreen({super.key});

  @override
  State<CreateQuotationScreen> createState() => _CreateQuotationScreenState();
}

class _CreateQuotationScreenState extends State<CreateQuotationScreen> {
  String? _selectedCountry;
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
          "Quotation",
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Rate Prediction', style: LightTheme.subHeader5),
                      Text('Rs 1,506 per sft', style: LightTheme.subHeader6),
                    ]),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.50,
                  child: DropdownButtonFormField<String>(
                    value: _selectedCountry,
                    icon: const Visibility(
                      visible: true,
                      child: Image(
                        image: AssetImage("assets/icons/dropdown-arrow.png"),
                        height: 22.0,
                        width: 17.0,
                      ),
                    ),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
                      hintText: 'Select Quotation',
                      hintStyle: LightTheme.subHeader9,
                      counter: SizedBox.shrink(),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: textFieldBorderColor,
                        ),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: '1 BHk Flat',
                        child: Text('1 BHk Flat'),
                      ),
                      DropdownMenuItem(
                        value: '2 BHk Flat',
                        child: Text('2 BHk Flat'),
                      ),
                      DropdownMenuItem(
                        value: '3 BHk Flat',
                        child: Text('3 BHk Flat'),
                      ),
                      DropdownMenuItem(
                        value: '4 BHk Flat',
                        child: Text('4 BHk Flat'),
                      ),
                      DropdownMenuItem(
                        value: '5 BHk Flat',
                        child: Text('5 BHk Flat'),
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
              ],
            ),
          ),
          const Divider(
            height: 40,
            color: Colors.grey,
            thickness: 1,
            // indent: 10,
            // endIndent: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Extimated Cost : ', style: LightTheme.subHeader11),
                  TextSpan(text: 'Rs 25,847576', style: LightTheme.subHeader5),
                ]),
              ),
            ),
          ),
          const Divider(
            height: 40,
            color: Colors.grey,
            thickness: 1,
            // indent: 10,
            // endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.40,
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: 'Cost of Cement Used for 50KG bag Brand : ',
                          style: LightTheme.subHeader5),
                      TextSpan(
                          text: 'Ambuja, ACC, Duragaurd Lafarge,\nUltratech',
                          style: LightTheme.subHeader11),
                    ]),
                  ),
                ),
                SizedBox(
                  height: height * 0.20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: CommonFormField(
                                  height: 46.0,
                                  width: 89.0,
                                  labelText: 'Quantities',
                                  labelStyle: TextStyle(
                                      fontSize: fontSize12,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins-Regular'),
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Expanded(
                                child: CommonFormField(
                                  height: 46.0,
                                  width: 85.0,
                                  labelText: 'INR 350',
                                  labelStyle: TextStyle(
                                      fontSize: fontSize14,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins-Regular'),
                                ),
                              ),
                            ]),
                      ),
                      RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                              text: 'Cost : ', style: LightTheme.subHeader11),
                          TextSpan(
                              text: 'Rs 25,847576',
                              style: LightTheme.subHeader5),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 40,
            color: Colors.grey,
            thickness: 1,
            // indent: 10,
            // endIndent: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: const Image(
          image: AssetImage("assets/icons/forward_arrow.png"),
          height: 18,
          width: 25,
        ),
      ),
    );
  }
}
