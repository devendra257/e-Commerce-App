// ignore_for_file: use_build_context_synchronously

import 'package:e_comm/apis/api_helper.dart';
import 'package:e_comm/apis/api_url.dart';
import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/imageConstant.dart';
import 'package:e_comm/model/login_model.dart';
import 'package:e_comm/pages/home_page.dart';
import 'package:e_comm/pages/on_boarding_screen/sign_up.dart';
import 'package:e_comm/share_pref/share_pref.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // late LoginModel loginModel;

  @override
  void initState() {
    super.initState();
    // getLoginApi();
  }

  getLoginApi({required LoginModel loginModel}) async {
    ApiHelper.getLoginApi(mUrl: Urls.loginUrl, loginModel: loginModel)
        .then((value) async {
      // print('value1: ${value['token']}');
      // var id =
      String mToken = value['token'];
      // ignore: unnecessary_brace_in_string_interps
      print('mToken: ${mToken}');

      await SharePref.setTokenId(token: mToken);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
      // print('value2: ${id.toString()}');
    });

    // print("Login Page: ${res['token']}");
  }

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
                      onPressed: () {
                        var email = emailController.text.toString();
                        var pass = passController.text.toString();

                        getLoginApi(
                            loginModel:
                                LoginModel(email: email, password: pass));
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
