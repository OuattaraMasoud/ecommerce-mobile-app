import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Colors
const Color blackColor = Colors.black;
const Color kWhiteColor = Colors.white;
const Color kGrayColor = Color(0XFF424242);
//const Color primaryColor = Colors.deepPurpleAccent;
const Color transparentColor = Colors.transparent;
const Color actionLinkColor = Colors.blueAccent;

Color kPrimaryColor = const Color(0xFF7B61FF); //Color(0XFF78D0B1);
const kPrimaryLightColor = Color(0xFF81C784);
const kPrimaryDarkColor = Color(0xFF388E3C);
final kPrimaryExtraDarkColor = Colors.red[900]!;
const kAccentColor = Color(0xFF2196F3);
const kAccentLightColor = Color(0xFF4FC3F7);
const kAccentDarkColor = Color(0xFF1976D2);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF303030);
const kTextDarkColor = Color(0xFFFEFEFE);
const kLightGray = Color(0XFFEEEEEE);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final heading2Style = TextStyle(
  fontSize: 13.sp,
  fontWeight: FontWeight.w500,
  color: kTextColor,
  height: 1,
);

bfLinearGradient({required Color middleColor}) => LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: const [0.0, 0.5, 1],
      colors: <Color>[
        kPrimaryColor.withOpacity(1),
        middleColor,
        kPrimaryColor.withOpacity(1),
      ],
    );
