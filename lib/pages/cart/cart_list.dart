import 'package:e_comm/constants/colorConstant.dart';
import 'package:e_comm/constants/iconConstant.dart';
import 'package:e_comm/app_widgets/text_style.dart';
import 'package:flutter/material.dart';

class CartListPage extends StatefulWidget {
  const CartListPage({super.key});

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteColor,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                child: Column(
                                  children: [
                                    Text(
                                      'Woman Sweater',
                                      style: mTextStyle16(
                                          mFontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
