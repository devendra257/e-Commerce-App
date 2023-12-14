import 'package:e_comm/apis/api_helper.dart';
import 'package:e_comm/apis/api_url.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/imageConstant.dart';
import 'package:e_comm/model/config_model.dart';
import 'package:e_comm/pages/home_page.dart';
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
  ConfigModel? configData;

  @override
  void initState() {
    super.initState();
    getConfigApi();
    getAnimate();
  }

  Future<ConfigModel> getConfigApi() async {
    configData = await ApiHelper.getConfigAPI(url: Urls.baseUrl);
    var baseUrl = configData!.baseUrls!;
    Urls.productImageUrl = baseUrl.productImageUrl!;
    Urls.productThumImageUrl = baseUrl.productThumbnailUrl!;
    Urls.digitalProductImageUrl = baseUrl.digitalProductUrl!;
    Urls.brandImageUrl = baseUrl.brandImageUrl!;
    Urls.customerImageUrl = baseUrl.categoryImageUrl!;
    Urls.categoryImageUrl = baseUrl.categoryImageUrl!;
    Urls.reviewImageUrl = baseUrl.reviewImageUrl!;
    Urls.sellerImageUrl = baseUrl.sellerImageUrl!;
    Urls.shopImageUrl = baseUrl.shopImageUrl!;
    Urls.bannerImageUrl = baseUrl.bannerImageUrl!;
    Urls.notificationImageUrl = baseUrl.notificationImageUrl!;
    return configData!;
  }

  getAnimate() {
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
