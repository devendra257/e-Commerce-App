import 'package:e_comm/app_widgets/spacing.dart';
import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:flutter/material.dart';

class CartListPage extends StatefulWidget {
  String itemId;
  String quantity;

  CartListPage({super.key, required this.itemId, required this.quantity});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
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
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: ColorConstant.blurGreyColor100,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                IconConstant.groceryIcon,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Woman Sweater',
                                      style: mTextStyle16(
                                          mFontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Woman Fashion',
                                      style: mTextStyle14(
                                          mFontWeight: FontWeight.w500,
                                          mColor: ColorConstant.greyColor),
                                    ),
                                    Text(
                                      '\$70.00',
                                      style: mTextStyle14(
                                          mFontWeight: FontWeight.bold,
                                          mColor: ColorConstant.blackColor),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
