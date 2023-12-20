// ignore_for_file: use_build_context_synchronously

import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/pages/home_page.dart';
import 'package:e_comm/pages/on_boarding_screen/login_page.dart';
import 'package:e_comm/share_pref/share_pref.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late var userID;

  @override
  void initState() {
    super.initState();
    userID = getSharedPref();
  }

  Future<String> getSharedPref() async {
    userID = await SharePref.getTokenId();
    setState(() {});
    return userID;
  }

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstant.greyColor300,
      appBar: AppBar(
        backgroundColor: ColorConstant.greyColor300,
        title: const Text('Profile Details'),
      ),
      body: userID == ''
          ? Container(
              color: ColorConstant.whiteColor,
              height: mHeight * 0.12,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: mTextStyle(
                          mFontWeight: FontWeight.w600,
                          mFontSize: mHeight * 0.02),
                    ),
                    hSpacer(mHeight: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Log in to get best offers',
                          style: mTextStyle16(),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(30, 30),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 31, vertical: 0),
                                backgroundColor:
                                    ColorConstant.orangeColorPrimary,
                                shape: const LinearBorder()),
                            child: Text(
                              'Login',
                              style: mTextStyle16(
                                  mColor: ColorConstant.whiteColor,
                                  mFontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Is Logged In',
                    style: mTextStyle20(),
                  ),
                  InkWell(
                    onTap: () async {
                      // await SharePref.setTokenId(token: '');
                      var clear = await SharePref.removeToken();

                      print("Clear Shared Pref -- $clear");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
