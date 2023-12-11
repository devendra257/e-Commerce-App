import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/dummy_data.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/my_widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int orderCount = 1;
  int myCarouslValue = 0;

  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.amber,xss
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Stack(
            children: [
              slider(mWidth),
              CircleAvatar(
                radius: mWidth * 0.06,
                child: Image.asset(
                  IconConstant.backIcon,
                  width: mWidth * 0.07,
                ),
              ),
              Positioned(
                right: 10,
                child: CircleAvatar(
                  radius: mWidth * 0.06,
                  child: const Icon(Icons.favorite_border_outlined),
                ),
              ),
              Align(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                      mColor: ColorConstant.whiteColor,
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
                        Container(
                          width: mWidth * 0.45,
                          decoration: BoxDecoration(
                            color: ColorConstant.orangeColorPrimary,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: mTextStyle16(
                                mColor: ColorConstant.whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // * Slider
  slider(double mWidth) {
    // return FutureBuilder(
    //   future: getLatestProductApi(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Text(snapshot.error.toString());
    //     } else if (snapshot.hasData) {
    //       if (snapshot.data != null) {
    return Column(
      children: [
        CarouselSlider(
          items: DummyData.dummyBanner.map((e) {
            return Container(
              width: mWidth,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(e)

                    // image:
                    //     NetworkImage('${Urls.bannerImageUrl}/${e.photo}'),
                    ),
              ),
              // borderRadius: BorderRadius.circular(31),
              // image: DecorationImage(image: AssetImage(e.toString()))),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2,
            onPageChanged: (index, reason) {
              myCarouslValue = index;
              setState(() {});
            },
          ),
        ),
        AnimatedSmoothIndicator(
          activeIndex: myCarouslValue,
          count: DummyData.dummyBanner.length,
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
  }
}
    //     return Container();
    //   },
    // );
  // }
// }
// 