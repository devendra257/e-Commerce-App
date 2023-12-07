import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/my_widgets/spacing.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> carouselSliderList = [
    'assets/images/carousal/1.webp',
    'assets/images/carousal/2.avif',
    'assets/images/carousal/3.jpg',
    'assets/images/carousal/4.jpg',
    'assets/images/carousal/5.avif',
    'assets/images/carousal/6.jpg',
    'assets/images/carousal/7.avif',
    'assets/images/carousal/8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mWidth = size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('E-Comm'),
      // ),

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

              CarouselSlider(
                  items: carouselSliderList.map((e) {
                    return Container(
                      color: Colors.amber,
                      width: mWidth,
                      child: Image.asset(e.toString()),
                    );
                  }).toList(),
                  options: CarouselOptions())
            ],
          ),
        ),
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
