import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/imageConstant.dart';
import 'package:e_comm/pages/on_boarding_screen/login_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  hSpacer(mHeight: 11),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 11),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 11),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 11),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 11),
                  TextField(
                    obscureText: true,
                    controller: passController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  hSpacer(mHeight: 11),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
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
                  hSpacer(),
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
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
