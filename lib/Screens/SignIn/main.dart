import 'package:builder_plus/Common/constant.dart';
import 'package:builder_plus/Component/Form/main.dart';
import 'package:builder_plus/Component/button/main.dart';
import 'package:builder_plus/Screens/Home/main.dart';
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
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hello",
                      style: LightTheme.header1,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Let's see construction expense manager",
                      style: LightTheme.header2,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CommonFormField(
                      hintText: "Username",
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CommonFormField(
                      hintText: "Password",
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
                      gapWidth: 0,
                      width: MediaQuery.of(context).size.width,
                      onButtonTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
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
                              color: Colors.black,
                              fontSize: fontSize16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]))
      ],
    ));
  }
}
