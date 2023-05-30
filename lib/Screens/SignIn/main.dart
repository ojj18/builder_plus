// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Component/Form/main.dart';
import 'package:builder_plus/Component/bottom/main.dart';
import 'package:builder_plus/Component/button/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: height * 0.17,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: height * 0.17,
                    child: Image(
                      image: const AssetImage("assets/icons/circle.png"),
                    ),
                  ),
                  Positioned(
                    top: 85.0,
                    right: 95.0,
                    child: SizedBox(
                      height: height * 0.04,
                      child: Image(
                        image: const AssetImage("assets/icons/clrcircle.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 97.0,
                    right: 107.0,
                    child: SizedBox(
                      height: height * 0.01,
                      width: 40.0,
                      child: Image(
                        image: const AssetImage("assets/icons/zigzag.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage("assets/icons/logo.png"),
                    height: height * 0.14,
                    width: width * 0.20,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Text(
                    "Hello",
                    style: LightTheme.subHeader10,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Let's see construction expense manager",
                    style: LightTheme.subHeader9,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: LightTheme.subHeader7,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff8F70FF)),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: LightTheme.subHeader7,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff8F70FF)),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: primaryColor,
                              value: isChecked,
                              onChanged: (value) {
                                isChecked = value!;
                                setState(() {});
                              }),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: fontSize14,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: fontSize14,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonButton(
                    height: 52,
                    gapWidth: 0,
                    width: width,
                    onButtonTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()));
                    },
                    fontSize: fontSize18,
                    fontfamily: 'Poppins-Bold',
                    buttonText: "LOGIN",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontFamily: 'Poppins-Bold',
                            color: Colors.black,
                            fontSize: fontSize18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]))
        ],
      )),
    );
  }
}
