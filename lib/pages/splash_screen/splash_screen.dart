import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/imageConstant.dart';
import 'package:e_comm/pages/main_pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController mController;

  late AnimationController mSecondController;

  late Animation<Size?> sizeAnim;
  var reverseCount = 0;

  @override
  void initState() {
    super.initState();

    mController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(
            () {
              setState(() {});
            },
          )
          ..forward()
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              }
            },
          );

    sizeAnim = SizeTween(begin: const Size(0, 0), end: const Size(200, 300))
        .animate(mController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.pinkColor100,
      body: Center(
        child: SizedBox(
          width: sizeAnim.value!.width,
          height: sizeAnim.value!.height,
          child: Image(
            image: AssetImage(ImageConstant.appIcon),
          ),
        ),
      ),
    );
  }
}
