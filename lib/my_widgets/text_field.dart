import 'package:e_comm/constants/colorConstant.dart';
import 'package:flutter/material.dart';

InputDecoration mInputDecoration({
  required String mHintText,
  required String mLabel,
  IconData? mPrifixIcon,
  IconData? mSuffixIcon,
  double? mRadius,
  Color? mPrifixIconsColor,
  Color? mSuffixIconsColor,
  VoidCallback? onTap,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(mRadius ?? 11),
      borderSide: BorderSide(color: ColorConstant.pinkColor100),
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.pinkColor100),
        borderRadius: BorderRadius.circular(mRadius ?? 11)),
    hintText: mHintText,
    label: Text(mLabel),
    prefixIcon: mPrifixIcon != null
        ? Icon(
            mPrifixIcon,
            color: mPrifixIconsColor ?? Colors.black,
          )
        : null,
    suffixIcon: mSuffixIcon != null
        ? InkWell(
            onTap: onTap,
            child: Icon(
              mSuffixIcon,
              color: mSuffixIconsColor ?? Colors.black,
              size: 30,
            ),
          )
        : null,
  );
}
