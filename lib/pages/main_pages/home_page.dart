import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/pages/main_pages/cat_page/cat_page.dart';
import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  late PageController pageController;

  final tab = [
    const CategoriesPage(),
    const Center(
      child: Text('fav'),
    ),
    const Center(
      child: Text('Cart'),
    ),
    const Center(
      child: Text('Profile'),
    ),
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);

    // print("Urls.productThumImageUrl---- ${Urls.productThumImageUrl}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: tab,
      ),
      bottomNavigationBar: WaterDropNavBar(
        iconSize: 30,
        waterDropColor: ColorConstant.orangeColorPrimary,
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          selectedIndex = index;
          setState(() {});
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutExpo);
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            filledIcon: Icons.home_filled,
            outlinedIcon: Icons.home_outlined,
          ),
          BarItem(
              filledIcon: Icons.favorite_rounded,
              outlinedIcon: Icons.favorite_border_rounded),
          BarItem(
            filledIcon: Icons.person_2,
            outlinedIcon: Icons.person_2_outlined,
          ),
          BarItem(
              filledIcon: Icons.shopping_cart,
              outlinedIcon: Icons.shopping_cart_outlined),
        ],
      ),
    );
  }
}
