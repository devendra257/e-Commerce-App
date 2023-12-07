import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/dummy_data.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/my_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int myCarouslValue = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mWidth = size.width;
    var mHeight = size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              //* Top Menu Item
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorConstant.greyColor200,
                    radius: mWidth * 0.06,
                    child: Image.asset(
                      IconConstant.menuIcon,
                      width: mWidth * 0.07,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: ColorConstant.greyColor200,
                    radius: mWidth * 0.06,
                    child: Image.asset(
                      IconConstant.notifiIcon,
                      width: mWidth * 0.06,
                    ),
                  ),
                ],
              ),
              hSpacer(mHeight: 11),
              searchBox(mWidth),
              hSpacer(mHeight: 11),

              slider(mWidth),
              hSpacer(mHeight: 3),
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
              hSpacer(mHeight: 11),
              catList(mHeight, mWidth)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox catList(double mHeight, double mWidth) {
    return SizedBox(
      height: mHeight * 0.14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DummyData.dummyCat.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: mWidth * 0.07,
                  backgroundColor: ColorConstant.orangeColor700OP,
                  child: Image.asset(
                    DummyData.dummyCat[index]['icon'],
                    width: mWidth * 0.1,
                  ),
                ),
                hSpacer(),
                Text(DummyData.dummyCat[index]['title'])
              ],
            ),
          );
        },
      ),
    );
  }

  //* Slider
  CarouselSlider slider(double mWidth) {
    return CarouselSlider(
      items: DummyData.dummyBanner.map((e) {
        return Container(
          width: mWidth,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(31),
              image: DecorationImage(image: AssetImage(e.toString()))),
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        aspectRatio: 2,
        onPageChanged: (index, reason) {
          myCarouslValue = index;
          setState(() {});
        },
      ),
    );
  }

  //* Search Box.
  Container searchBox(double mWidth) {
    return Container(
      width: mWidth,
      decoration: BoxDecoration(
        color: ColorConstant.greyColor200,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Image.asset(
                IconConstant.searchIcon,
                width: mWidth * 0.09,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstant.tranColorPrimary,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorConstant.orangeColorPrimary,
                        ),
                      ),
                      hintText: 'Search....'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: VerticalDivider(
                  color: ColorConstant.greyColor,
                  thickness: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  IconConstant.filterIcon,
                  width: mWidth * 0.06,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
