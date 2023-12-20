import 'package:e_comm/apis/api_helper.dart';
import 'package:e_comm/apis/api_url.dart';
import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:e_comm/model/cart_list_model.dart';
import 'package:e_comm/share_pref/share_pref.dart';
import 'package:flutter/material.dart';

class CartListPage extends StatefulWidget {
  String itemId;
  String quantity;

  CartListPage({super.key, required this.itemId, required this.quantity});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  late Future<List<CartListModel>> cartListModel;

  @override
  void initState() {
    super.initState();
    cartListModel = getCartList();
  }

  Future<List<CartListModel>> getCartList() async {
    var token = await SharePref.getTokenId();
    print("User Token - $token");
    var response = await ApiHelper.cartListApi(
      mUrl: Urls.cartListUrl,
      token: token,
    );
    // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmU5ZDM4YjUyMDJkMjJkZTZhNjQ4NjM1OGNmYWJiOGEwN2FmYmQyYjE0Y2VjMGYzM2ZjYzU2M2UwOGVkYzJlZjM1NDJjZmE5OTA1NzJhMzMiLCJpYXQiOjE3MDE5Njc4MzkuNzQ0MDI4LCJuYmYiOjE3MDE5Njc4MzkuNzQ0MDMsImV4cCI6MTczMzU5MDIzOS43Mzk0MDgsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.MmIUjtc6BxbvQo45BnLfd2rzsrVNb_Xcdn5VoxwcbN6CUnhZMn_xUatoKNermmvZSWI19PpAbmGB8W_VwLZ6abkZnZUWvCS9tVSyhSuKNva8LYIseJ-QDbpPUe7jh20e-gPIg38P7OzwXYZeMaSQHWoDf5JEYOSWEdL59CBp4pD3BEHtkXq9nHWNSyKUBDAX3pcH6-fEJ5tLnOAXmTrulwd6naqOipJUrkIX3tsJnPnLsbjvFhYnl8l541NyLz5AyLMj7_FFHFklU9xILFE5-JeSMKSQm4yqxNJwY6pYd8MmTs9GoE48y0I1jQAVc98zyWK22i3XMK5GTI-kvsl-1QlvQgHbRvg0UWmkTyjBIvWKdEP9jwkMOOXnE1Ua2P3VKgqAkzwO7kq2atkrVyuAeSidTkUezzouwL4Mtem6OxanouGFTlNgk9qgxgoUkNeP0b-4qN4DqpxUPYxYKGlTHSWtuf6Nud_2n3Zz30CHn_kv9GBxmt5a85SYDp-ylkAOGUQxzX_mGUJDD63BPiWQBke61nZ1NZua2iAvPyNtUriKdS3ZkL5rZ40tET9y-wGlTPJQkwujF8hxTRx5vahsTxNdg1nIEWSEs1hJZ42FCdhgivqj1KJQMA6qs3rZypAzjz4GtgkfTFVxxwp758zHsanECP-9lptBCG2gA7Riuaw');
    // print('Response --> $response');
    // List cartDataList = response;
    List<CartListModel> listModel = [];

    for (var element in response) {
      listModel.add(CartListModel.fromJson(element));
    }

    print("Data Length ${listModel.length}}");
    // cartListModel = cartDataList.map((e) => CartListModel.fromJson(e)).toList();
    return listModel;
  }

  @override
  Widget build(BuildContext context) {
    // print('Item Count :- ${widget.itemId}');
    // print('Order Count :- ${widget.quantity}');
    var mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstant.greyColor200,
      appBar: AppBar(
        backgroundColor: ColorConstant.greyColor200,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            radius: mWidth * 0.06,
            child: Image.asset(
              IconConstant.backIcon,
              width: mWidth * 0.07,
            ),
          ),
        ),
        title: const Text(
          'My cart',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: cartListModel,
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
                  if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                    return Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        itemBuilder: (context, index) {
                          return Card(
                            surfaceTintColor: ColorConstant.whiteColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: mWidth * 0.2,
                                    height: mWidth * 0.2,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blurGreyColor100,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        width: mWidth * 0.25,
                                        height: mWidth * 0.25,
                                        "${Urls.productThumImageUrl}/${snapshot.data![index].thumbnail!}",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(11.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 100,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${snapshot.data![index].name}',
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: mTextStyle16(
                                                    mFontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${snapshot.data![index].productId}',
                                                style: mTextStyle14(
                                                    mFontWeight:
                                                        FontWeight.w500,
                                                    mColor: ColorConstant
                                                        .greyColor),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$${snapshot.data![index].price}',

                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: ColorConstant
                                                            .blackColor),

                                                    // style: mTextStyle14(
                                                    //   mFontWeight:
                                                    //       FontWeight.bold,
                                                    //   mColor: ColorConstant
                                                    //       .blackColor,
                                                    // ),
                                                  ),
                                                  wSpacer(),
                                                  Text(
                                                    '\$${snapshot.data![index].discount}',
                                                    style: mTextStyle14(
                                                      mFontWeight:
                                                          FontWeight.bold,
                                                      mColor: ColorConstant
                                                          .blackColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.delete_forever_rounded,
                                              color: ColorConstant.redColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return Container();
              },
            ),
            Container(
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(41),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      2,
                      -6.0,
                    ),
                  )
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorConstant.greyColor200,
                            borderRadius: BorderRadius.circular(21)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  cursorColor: ColorConstant.orangeColorPrimary,
                                  decoration: const InputDecoration(
                                      hintText: 'Apply Discount Code',
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      )),
                                ),
                              ),
                              Text(
                                'Apply',
                                style: mTextStyle18(
                                    mFontWeight: FontWeight.bold,
                                    mColor: ColorConstant.orangeColorPrimary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      hSpacer(mHeight: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: mTextStyle18(
                                mColor: ColorConstant.greyColor,
                                mFontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$200.00',
                            style: mTextStyle20(
                                mColor: ColorConstant.blackColor,
                                mFontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      hSpacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax 18%',
                            style: mTextStyle18(
                                mColor: ColorConstant.greyColor,
                                mFontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$36.00',
                            style: mTextStyle20(
                                mColor: ColorConstant.blackColor,
                                mFontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      hSpacer(mHeight: 8),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: mTextStyle18(
                                mColor: ColorConstant.greyColor,
                                mFontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$236.00',
                            style: mTextStyle20(
                                mColor: ColorConstant.blackColor,
                                mFontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      hSpacer(mHeight: 5),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.orangeColorPrimary,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 11)),
                          onPressed: () {},
                          child: Text(
                            'Checkout',
                            style:
                                mTextStyle18(mColor: ColorConstant.whiteColor),
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
    );
  }
}
