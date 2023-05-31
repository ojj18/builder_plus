import 'package:builder_plus/Common/constant.dart';
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
                const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'Extimated Cost : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
              TextSpan(
                  text: 'Rs 25,847576',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.purple)),
            ]),
          ),
        ],
      ),
    );
  }
}
