import 'package:flutter/material.dart';

mScaffoldMessengerBtn({
  required BuildContext context,
  required String msg,
  double mMargin = 0,
  double mVerPadding = 5,
  double mHorPadding = 0,
  String? mLabel,
  VoidCallback? mTap,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      margin: EdgeInsets.all(mMargin),
      padding:
          EdgeInsets.symmetric(vertical: mVerPadding, horizontal: mHorPadding),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: mLabel ?? '', onPressed: mTap ?? () {}),
    ),
  );
}

mScaffoldMessenger(
    {required dynamic context,
    required String mText,
    Color mColor = Colors.black}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mText),
      backgroundColor: mColor,
    ),
  );
}
