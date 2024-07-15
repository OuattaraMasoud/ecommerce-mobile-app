// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:e_commerce_project/common/constant.dart';
import 'package:e_commerce_project/constants.dart' as black;
import 'package:e_commerce_project/theme/button_theme.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  const scaffoldBackgroundColor = Colors.white;
  const cardColor = Colors.white;
  return ThemeData(
    scaffoldBackgroundColor:
        scaffoldBackgroundColor, // kLightGray, // Colors.white,
    brightness: Brightness.light,
    primarySwatch: black.primaryMaterialColor,
    primaryColor: black.primaryColor,

    fontFamily: Platform.isIOS ? "Muli" : "Gotham",
    appBarTheme: lightAppBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: lightInputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColorLight: kPrimaryLightColor,
    primaryColorDark: kPrimaryDarkColor,
    cardColor: cardColor,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    cardTheme: cardTheme(),
    sliderTheme: const SliderThemeData().copyWith(
      activeTrackColor: kPrimaryDarkColor,
      inactiveTrackColor: kPrimaryLightColor.withOpacity(0.7),
      thumbColor: kPrimaryDarkColor,
    ),
    dialogTheme: const DialogTheme().copyWith(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: kTextColor)),
    bottomSheetTheme: const BottomSheetThemeData()
        .copyWith(modalBackgroundColor: const Color(0XFFFAFAFA)),
    snackBarTheme: const SnackBarThemeData().copyWith(
      backgroundColor: Colors.grey[700],
      contentTextStyle: const TextStyle(
        color: Colors.white70,
      ),
      actionTextColor: kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    dividerTheme: const DividerThemeData().copyWith(
      indent: 10,
      endIndent: 10,
    ),
    bottomNavigationBarTheme: bottomNavigationBarTheme().copyWith(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey[900],
      backgroundColor: Colors.transparent,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue[800],
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: kAccentColor)
        .copyWith(secondary: kAccentColor)
        .copyWith(background: Colors.white),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        }
        return null;
      }),
    ),
  );
}

ThemeData darkTheme() {
  const scaffoldBackgroundColor = Colors.black;
  const cardColor = Color(0XFF26282A);
  return lightTheme().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    brightness: Brightness.dark,
    cardColor: cardColor, //Colors.grey[900],
    canvasColor: const Color(0XFF26282A),
    cardTheme: cardTheme(),
    inputDecorationTheme: darkInputDecorationTheme,

    disabledColor: kSecondaryColor,
    textTheme: textTheme().copyWith(
      bodyLarge: textTheme().bodyLarge!.copyWith(
            color: Colors.white70,
          ),
      bodyMedium: textTheme().bodyMedium!.copyWith(
            color: Colors.white70,
          ),
      bodySmall: const TextStyle(color: Colors.white60),
      headlineSmall: const TextStyle(color: Colors.white70),
      titleLarge: const TextStyle(color: Colors.white70),
    ),
    appBarTheme: lightAppBarTheme().copyWith(
      color: Colors.white70, // const Color(0XFF212121), // Colors.black87,
      iconTheme: IconThemeData(color: blackColor),
    ),
    dialogTheme: const DialogTheme().copyWith(
      backgroundColor: Colors.grey[850],
      titleTextStyle: const TextStyle(color: Colors.white70),
    ),
    bottomNavigationBarTheme: bottomNavigationBarTheme().copyWith(
      backgroundColor: Colors.grey[200],
      unselectedItemColor: Colors.grey[200],
      selectedItemColor: Colors.red,
    ),

    bottomSheetTheme: const BottomSheetThemeData().copyWith(
      backgroundColor: Colors.grey[900],
      modalBackgroundColor: Colors.grey[900],
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData()
        .copyWith(color: Colors.white70, borderColor: Colors.white12),
    snackBarTheme: lightTheme().snackBarTheme.copyWith(
        backgroundColor: Colors.grey[400],
        contentTextStyle: const TextStyle(color: Colors.black54)),
    dividerTheme: const DividerThemeData()
        .copyWith(indent: 10, endIndent: 10, color: Colors.white12),
    listTileTheme: const ListTileThemeData().copyWith(),
  );
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData().copyWith(
    showUnselectedLabels: false,
    elevation: 15,
    enableFeedback: true,
    selectedIconTheme:
        const IconThemeData().copyWith(size: 24, color: Colors.grey.shade800),
    unselectedIconTheme:
        const IconThemeData().copyWith(size: 24, color: Colors.grey.shade800),
  );
}

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor: black.lightGreyColor,
  filled: true,
  hintStyle: TextStyle(color: black.greyColor),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: black.darkGreyColor,
  filled: true,
  hintStyle: TextStyle(color: black.whileColor40),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(black.defaultBorderRadious)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(black.defaultBorderRadious)),
  borderSide: BorderSide(color: black.primaryColor),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(black.defaultBorderRadious)),
  borderSide: BorderSide(
    color: black.errorColor,
  ),
);

OutlineInputBorder secodaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius:
        const BorderRadius.all(Radius.circular(black.defaultBorderRadious)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}

TextTheme textTheme() {
  return GoogleFonts.poppinsTextTheme(
    const TextTheme(
      bodyLarge: TextStyle(color: kTextColor),
      bodyMedium: TextStyle(color: kTextColor),
    ),
  );
}

CardTheme cardTheme() {
  return CardTheme(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ));
}

AppBarTheme lightAppBarTheme() {
  return AppBarTheme(
    color: kTextColor,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: textTheme()
        .copyWith(
          titleLarge: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 18.sp,
          ),
        )
        .bodyMedium,
    titleTextStyle: textTheme()
        .copyWith(
          titleLarge: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 18.sp,
          ),
        )
        .titleLarge,
  );
}

TextStyle mediumGoogleFontTextStyle(
    {double fontSize = 14.0, fontWeight = FontWeight.w500, Color? color}) {
  return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
}

Widget simpleDefaultCard(
    {required Widget child,
    double elevation = 0.5,
    double verticalMargin = 10.0,
    double horizontalMargin = 0.0,
    double verticalPadding = 3.0,
    double horizontalPadding = 7.0,
    Color? color,
    required BuildContext context,
    double? borderRadius}) {
  return Card(
      elevation: elevation,
      color: color ??
          (Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]
              : null),
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )
          : null,
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin, horizontal: horizontalMargin),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        child: child,
      ));
}
