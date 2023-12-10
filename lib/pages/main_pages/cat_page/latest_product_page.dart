// import 'package:e_comm/apis/api_helper.dart';
// import 'package:e_comm/apis/api_url.dart';
// import 'package:e_comm/constants/colorConstant.dart';
// import 'package:e_comm/model/latest_product_model.dart';
// import 'package:e_comm/my_widgets/spacing.dart';
// import 'package:e_comm/my_widgets/text_style.dart';
// import 'package:flutter/material.dart';

// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({
//     super.key,
//     required this.mWidth,
//     required this.mHeight,
//   });

//   final double mWidth;
//   final double mHeight;

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
//   late Future<LatestProductModel> latestProductModel;

//   @override
//   void initState() {
//     super.initState();

//     latestProductModel = getLatestProductApi();
//   }

//   Future<LatestProductModel> getLatestProductApi() async {
//     latestProductModel =
//         ApiHelper.getLatestProductApi(mUrl: Urls.latestProductUrl);
//     return latestProductModel;
//   }

//   //* Get Latest Product Data
//   // Future<LatestProductModel> getLatestProductApi() async {
//   //   var data = await ApiHelper.getBannerApi(url: Urls.latestProductUrl);
//   //   latestProductModel = data;
//   //   return latestProductModel;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: latestProductModel,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text('${snapshot.error}'),
//           );
//         } else if (snapshot.hasData) {
//           return GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 11,
//               crossAxisSpacing: 11,
//               childAspectRatio: 2 / 2.3,
//             ),
//             itemCount: snapshot.data!.products!.length,
//             itemBuilder: (context, index) {
//               var productData = snapshot.data!.products![index];
//               // print(
//               //     "Product Name-->   ${snapshot.data!.products![index].name!}");
//               return Container(
//                 width: widget.mWidth * 0.1,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(21),
//                   color: ColorConstant.greyColor200,
//                 ),
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         width: widget.mWidth * 0.1,
//                         height: widget.mWidth * 0.1,
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(21),
//                             bottomLeft: Radius.circular(11),
//                           ),
//                           color: ColorConstant.orangeColorPrimary,
//                         ),
//                         child: Icon(
//                           Icons.favorite_border_outlined,
//                           color: ColorConstant.whiteColor,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: CircleAvatar(
//                         radius: widget.mWidth * 0.125,
//                         backgroundImage: NetworkImage(
//                             "${Urls.productThumImageUrl}/${productData.thumbnail}"),
//                         // child: Image.network(
//                         //   "${Urls.productThumImageUrl}/${productData.thumbnail}",
//                         //   width: widget.mWidth * 0.27,
//                         // ),
//                       ),
//                     ),
//                     hSpacer(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text(
//                         '${productData.name}',
//                         overflow: TextOverflow.ellipsis,
//                         // maxLines: 2,
//                         style: mTextStyle16(mFontWeight: FontWeight.w600),
//                       ),
//                     ),
//                     hSpacer(),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 11),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '\$${productData.purchasePrice}',
//                             style: mTextStyle14(mFontWeight: FontWeight.w600),
//                           ),
//                           wSpacer(mWidth: 11),
//                           Expanded(
//                             child: SizedBox(
//                                 height: widget.mHeight * 0.03,
//                                 child: ListView.builder(
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: 4,
//                                   itemBuilder: (context, index) {
//                                     return Container(
//                                       margin: const EdgeInsets.only(right: 5),
//                                       width: widget.mWidth * 0.05,
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.red,
//                                       ),
//                                     );
//                                   },
//                                 )),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         }

//         return Container();
//       },
//     );
//   }

//   int changeHexColor(String hexColorCode) {
//     hexColorCode = hexColorCode.toUpperCase().replaceAll("#", '');

//     if (hexColorCode.length == 6) {
//       hexColorCode = 'FF' + hexColorCode;
//     }
//     print("${int.parse(hexColorCode)}");
//     return int.parse(hexColorCode);
//   }
// }
