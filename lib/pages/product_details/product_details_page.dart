// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/apis/api_helper.dart';
import 'package:e_comm/apis/api_url.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/model/latest_product_model.dart';
import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/pages/add_cart_list/add_cart_list_page.dart';
import 'package:e_comm/pages/on_boarding_screen/login_page.dart';
import 'package:e_comm/share_pref/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  int mIndex;
  ProductDetailPage({super.key, required this.mIndex});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Future<LatestProductModel> latestProductModel;
  int orderCount = 1;
  int myCarouslValue = 0;
  bool visiableBorder = true;
  // bool isAddtoCart = false;

  @override
  void initState() {
    latestProductModel = getLatestProductApi();
    super.initState();
  }

//* Get Latest Product Data
  Future<LatestProductModel> getLatestProductApi() async {
    latestProductModel =
        ApiHelper.getLatestProductApi(mUrl: Urls.latestProductUrl);
    return latestProductModel;
  }

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.amber,xss
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: FutureBuilder(
          future: getLatestProductApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              if (snapshot.data != null &&
                  snapshot.data!.products!.isNotEmpty) {
                var productDetails = snapshot.data!.products![widget.mIndex];
                // var a = productDetails.colors!.elementAt(widget.mIndex).code;

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //* Slider
                          slider(snapshot),
                          hSpacer(),
                          Text(
                            '${productDetails.name}',
                            style: mTextStyle20(mFontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$${productDetails.purchasePrice}',
                            style: mTextStyle18(mFontWeight: FontWeight.bold),
                          ),
                          hSpacer(mHeight: 11),
                          Text(
                            'Color',
                            style: mTextStyle18(mFontWeight: FontWeight.bold),
                          ),
                          hSpacer(mHeight: 6),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: ColorConstant.blackColor),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: FractionallySizedBox(
                                heightFactor:
                                    0.85, // Adjust those two for the white space
                                widthFactor: 0.85,
                                child: Container(
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hSpacer(mHeight: 11),
                          Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: ColorConstant.orangeColor700OP,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Text(
                              'Description',
                              style: mTextStyle18(mFontWeight: FontWeight.bold),
                            ),
                          ),
                          hSpacer(),
                          Text(
                            '${productDetails.metaDescription}',
                            style: mTextStyle16(),
                          ),
                        ],
                      ),

                      //* Back Icon
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          radius: mWidth * 0.06,
                          child: Image.asset(
                            IconConstant.backIcon,
                            width: mWidth * 0.07,
                          ),
                        ),
                      ),

                      //* Fav Icon Border
                      Positioned(
                        right: 10,
                        child: CircleAvatar(
                          radius: mWidth * 0.06,
                          child: const Icon(Icons.favorite_border_outlined),
                        ),
                      ),

                      //* Add To Cart Wigdet
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: mWidth * 0.17,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(51),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: mWidth * 0.35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(51),
                                        border: Border.all(
                                          width: 2,
                                          color: ColorConstant.whiteColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 11, vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (orderCount > 1) {
                                                  orderCount--;
                                                  setState(() {});
                                                }
                                              },
                                              child: Image.asset(
                                                IconConstant.minusIcon,
                                                color: ColorConstant.whiteColor,
                                              ),
                                            ),
                                            Text(
                                              '$orderCount',
                                              style: mTextStyle20(
                                                  mColor:
                                                      ColorConstant.whiteColor,
                                                  mFontWeight: FontWeight.bold),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (orderCount < 10) {
                                                  orderCount++;
                                                  setState(() {});
                                                }
                                              },
                                              child: Image.asset(
                                                IconConstant.addIcon,
                                                color: ColorConstant.whiteColor,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        var id = await SharePref.getTokenId();
                                        if (id != '') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartListPage(),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: mWidth * 0.45,
                                        decoration: BoxDecoration(
                                          color:
                                              ColorConstant.orangeColorPrimary,
                                          borderRadius:
                                              BorderRadius.circular(31),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Add to cart',
                                            style: mTextStyle16(
                                              mColor: ColorConstant.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  StatefulBuilder slider(AsyncSnapshot<LatestProductModel> snapshot) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            CarouselSlider(
              items: snapshot.data!.products![widget.mIndex].images!.map((e) {
                var image = "${Urls.productImageUrl}/$e";
                return ClipRRect(
                  borderRadius: BorderRadius.circular(31),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                aspectRatio: 1,
                onPageChanged: (index, reason) {
                  myCarouslValue = index;
                  setState(() {});
                },
              ),
            ),
            hSpacer(),
            AnimatedSmoothIndicator(
              activeIndex: myCarouslValue,
              count: snapshot.data!.products![widget.mIndex].images!.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
                dotColor: ColorConstant.greyColor,
                activeDotColor: ColorConstant.orangeColorPrimary,
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ],
        );
      },
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
