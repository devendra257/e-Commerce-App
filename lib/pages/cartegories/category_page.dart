import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comm/apis/api_helper.dart';
import 'package:e_comm/apis/api_url.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/dummy_data.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/model/banner_model.dart';
import 'package:e_comm/model/latest_product_model.dart';
import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/pages/product_details/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int myCarouslValue = 0;
  late Future<List<BannerModel>> bannerModel;

  @override
  void initState() {
    super.initState();
    bannerModel = getBannerApi();
  }

  //* Get Banner Data
  Future<List<BannerModel>> getBannerApi() async {
    var data = await ApiHelper.getBannerApi(url: Urls.bannerUrl);
    List bannerDataList = data;
    List<BannerModel> bannerModel = [];
    bannerModel = bannerDataList.map((e) => BannerModel.fromJson(e)).toList();
    return bannerModel;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var mWidth = size.width;
    var mHeight = size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
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

                hSpacer(mHeight: 11),
                catList(mHeight, mWidth),
                //* Special Offer For You
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Special Offer For You',
                      style: mTextStyle20(mFontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: ColorConstant.orangeColorPrimary,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorConstant.orangeColorPrimary,
                        ),
                      ),
                    )
                  ],
                ),
                CategoryWidget(mWidth: mWidth, mHeight: mHeight)
              ],
            ),
          ),
        ),
      ),
    );
  }

  //* Category
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

  // * Slider
  slider(double mWidth) {
    return FutureBuilder(
      future: bannerModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Column(
              children: [
                CarouselSlider(
                  items: snapshot.data!.map((e) {
                    return Container(
                      width: mWidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${Urls.bannerImageUrl}/${e.photo}'))),
                      // borderRadius: BorderRadius.circular(31),
                      // image: DecorationImage(image: AssetImage(e.toString()))),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    aspectRatio: 3,
                    onPageChanged: (index, reason) {
                      myCarouslValue = index;
                      setState(() {});
                    },
                  ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: myCarouslValue,
                  count: snapshot.data!.length,
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
        return Container();
      },
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

// * Category Widget
class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    required this.mWidth,
    required this.mHeight,
  });

  final double mWidth;
  final double mHeight;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<LatestProductModel> latestProductModel;

  @override
  void initState() {
    super.initState();

    latestProductModel = getLatestProductApi();
  }
  //* Get Latest Product Data

  Future<LatestProductModel> getLatestProductApi() async {
    latestProductModel =
        ApiHelper.getLatestProductApi(mUrl: Urls.latestProductUrl);
    return latestProductModel;
  }

  // Future<LatestProductModel> getLatestProductApi() async {
  //   var data = await ApiHelper.getBannerApi(url: Urls.latestProductUrl);
  //   latestProductModel = data;
  //   return latestProductModel;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: latestProductModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data!.products!.isNotEmpty) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                childAspectRatio: 2 / 2.3,
              ),
              itemCount: snapshot.data!.products!.length,
              itemBuilder: (context, index) {
                var productData = snapshot.data!.products![index];
                // print(
                //     "Product Name-->   ${snapshot.data!.products![index].name!}");
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          mIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: widget.mWidth * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: ColorConstant.greyColor200,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: widget.mWidth * 0.1,
                            height: widget.mWidth * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(21),
                                bottomLeft: Radius.circular(11),
                              ),
                              color: ColorConstant.orangeColorPrimary,
                            ),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: ColorConstant.whiteColor,
                            ),
                          ),
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: widget.mWidth * 0.125,
                            backgroundImage: NetworkImage(
                                "${Urls.productThumImageUrl}/${productData.thumbnail}"),
                            // child: Image.network(
                            //   "${Urls.productThumImageUrl}/${productData.thumbnail}",
                            //   width: widget.mWidth * 0.27,
                            // ),
                          ),
                        ),
                        hSpacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '${productData.name}',
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                            style: mTextStyle16(mFontWeight: FontWeight.w600),
                          ),
                        ),
                        hSpacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${productData.purchasePrice}',
                                style:
                                    mTextStyle14(mFontWeight: FontWeight.w600),
                              ),
                              wSpacer(mWidth: 11),
                              Expanded(
                                child: SizedBox(
                                  height: widget.mHeight * 0.03,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productData.colors!.length,
                                    itemBuilder: (context, index) {
                                      var a = productData.colors!
                                          .elementAt(index)
                                          .code;

                                      // print('Color $a');
                                      return Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        width: widget.mWidth * 0.05,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: HexColor.fromHex(
                                            a!,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }

        return Container();
      },
    );
  }

  // Color changeHexColor({required String hexColorCode}) {
  //   hexColorCode = hexColorCode.toLowerCase().replaceAll("#", '');

  //   print("Hex first - $hexColorCode");

  //   if (hexColorCode.length == 6) {
  //     hexColorCode = "0xFF" + hexColorCode;
  //   }
  //   print(hexColorCode);
  //   return Color(int.parse(hexColorCode, radix: 16));
  // }
}

extension HexColor on Color {
  /// String is in the format "#aabbcc" or "ffaabbcc" with an optional leading "#".
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
