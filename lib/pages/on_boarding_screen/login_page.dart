import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_field.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/imageConstant.dart';
import 'package:e_comm/pages/on_boarding_screen/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    // var mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.orange.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstant.appIcon,
                    width: mWidth * 0.25,
                    // height: mWidth * 0.1,
                  ),
                  hSpacer(mHeight: 21),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 21),
                  TextField(
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 21),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          backgroundColor: Colors.white,
                          shape: const LinearBorder()),
                      child: Text(
                        'Login',
                        style: mTextStyle20(
                            mColor: ColorConstant.blackColor,
                            mFontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  hSpacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot Password',
                      style: mTextStyle16(
                          mColor: ColorConstant.whiteColor,
                          mFontWeight: FontWeight.w600),
                    ),
                  ),
                  hSpacer(mHeight: 7),
                  Text(
                    'OR',
                    style: mTextStyle25(
                        mColor: ColorConstant.whiteColor,
                        mFontWeight: FontWeight.w900),
                  ),
                  hSpacer(mHeight: 7),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          backgroundColor: Colors.white,
                          shape: const LinearBorder()),
                      child: Text(
                        'SignUp',
                        style: mTextStyle20(
                            mColor: ColorConstant.blackColor,
                            mFontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
