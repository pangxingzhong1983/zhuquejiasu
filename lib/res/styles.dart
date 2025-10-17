
import 'package:zhuquejiasu/res/them_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyColors {

  static const Color appMain = Color(0xFFEC6F36);

  static const Color red = Color(0xFFFF4759);
  static const Color darkRed = Color(0xFFE03E4E);

  static const Color textDisabled = Color(0xFFD4E2FA);
  static const Color darkTextDisabled = Color(0xFFCEDBF2);

  static const Color buttonDisabled = Color(0xFF96BBFA);
  static const Color darkButtonDisabled = Color(0xFF83A5E0);

  static const Color unselectedItemColor = Color(0xffbfbfbf);
  static const Color darkUnselectedItemColor = Color(0xFF4D4D4D);

  static const Color gradientBlue = Color(0xFF5793FA);
  static const Color shadowBlue = Color(0x805793FA);
  static const Color orange = Color(0xFFFF8547);

  static const Color app595757 = Color(0xFF595757);
  static const Color app5BB975 = Color(0xFF5BB975);
  static const Color appD7000F = Color(0xFFD7000F);
  static const Color app070E38 = Color(0xFF070E38);
  static const Color app83869B = Color(0xFF83869B);
  static const Color appE6E7EB = Color(0xFFE6E7EB);
  static const Color app9FA0A0 = Color(0xFF9FA0A0);
  static const Color appF7EFCD = Color(0xFFF7EFCD);
  static const Color appEFEFEF = Color(0xFFEFEFEF);
  static const Color appF4F6F9 = Color(0xFFF4F6F9);
  static const Color appC9CACA = Color(0xFFC9CACA);
  static const Color appEDEDED = Color(0xFFEDEDED);
  static const Color app999999 = Color(0xFF999999);
  static const Color app898989 = Color(0xFF898989);
  static const Color appFDD469 = Color(0xFFFDD469);
  static const Color app7FC377 = Color(0xFF7FC377);
  static const Color appD3D5D6 = Color(0xFFD3D5D6);
  static const Color appE5EDFF = Color(0xFFE5EDFF);
  static const Color app666666 = Color(0xFF666666);
  static const Color appF53F3F = Color(0xFFF53F3F);
  static const Color app3AB787 = Color(0xFF3AB787);
  static const Color appF7F7FF = Color(0xFFF7F7FF);
  static const Color app3E3A39 = Color(0xFF3E3A39);
  static const Color appF9ECD5 = Color(0xFFF9ECD5);
  static const Color appFBEEE1 = Color(0xFFFBEEE1);
  static const Color appD1F5EE = Color(0xFFD1F5EE);
  static const Color appEAEAEA = Color(0xFFEAEAEA);
  static const Color appE1E1E1 = Color(0xFFE1E1E1);
  static const Color appEC6F37 = Color(0xFFEC6F37);
  static const Color appF2F5F8 = Color(0xFFF2F5F8);
  static const Color appC8C9C9 = Color(0xFFC8C9C9);
  static const Color appFED426 = Color(0xFFFED426);
  static const Color appEBEDEF = Color(0xFFEBEDEF);
  static const Color app9E9F9F = Color(0xFF9E9F9F);
  static const Color app191A39 = Color(0xFF191A39);
  static const Color appDDD9EC = Color(0xFFDDD9EC);
  static const Color app434480 = Color(0xFF434480);
  static const Color app8D8ABD = Color(0xFF8D8ABD);
  static const Color appEC6F36 = Color(0xFFEC6F36);
  static const Color app807FB1 = Color(0xFF807FB1);
  static const Color app02002E = Color(0xFF02002E);
  static const Color app231815 = Color(0xFF231815);
  static const Color app1B1A43 = Color(0xFF1B1A43);
  static const Color appA3A3B3 = Color(0xFFA3A3B3);

  static Color get searchBgColor =>
      ThemConfig.isDarkMode ? Color.fromRGBO(255, 255, 255, 0.06) :  Color.fromRGBO(0, 0, 0, 0.06);

  ///线条颜色
  static Color get dividerColor => ThemConfig.isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06);
  static Color dividerColorWith(bool isDarkMode) => isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06);

  ///背景颜色
  static Color get bgColor => ThemConfig.isDarkMode ? MyColors.app02002E : MyColors.appEFEFEF;
  static Color bgColorWith(bool isDarkMode)  => isDarkMode ? MyColors.app02002E : MyColors.appEFEFEF;

  static Color get bgColor1 => ThemConfig.isDarkMode ? MyColors.app02002E : MyColors.appF4F6F9;

  static Color get bgColor2 => ThemConfig.isDarkMode ? MyColors.app1B1A43 : const Color(0xfff8f8f8);

  ///item背景颜色
  static Color get itemBgColor => ThemConfig.isDarkMode ? Colors.black.withValues(alpha: 0) : Colors.white.withValues(alpha: 0.06);
  static Color itemBgColorWith(bool isDarkMode)  => isDarkMode ? Colors.black.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.7);

  ///底部bar
  static Color get bottomAppBarBgColor => ThemConfig.isDarkMode ? MyColors.app1B1A43 : MyColors.appEAEAEA;
  static Color bottomAppBarBgColorWith(bool isDarkMode) => isDarkMode ? MyColors.app1B1A43 : MyColors.appEAEAEA;

  ///返回按钮颜色
  static Color get backButtonColor => ThemConfig.isDarkMode ? Colors.white : Colors.black;
  static Color backButtonColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black;

  ///按钮默认白色背景色
  static Color get btnFFFColor => ThemConfig.isDarkMode ? Colors.white.withValues(alpha: 0.3) : Colors.white;
  static Color btnFFFColorWith(bool isDarkMode) => isDarkMode ? Colors.white.withValues(alpha: 0.3) : Colors.white;

  ///icon颜色
  static Color get iconColor => ThemConfig.isDarkMode ? MyColors.app8D8ABD : MyColors.appEC6F36;
  static Color iconColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black;


  ///主要文字
  static Color get textColor => ThemConfig.isDarkMode ? Colors.white : Colors.black ;
  static Color textColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black ;

  ///灰色文字
  static Color get textGrayColor => MyColors.app898989;
  static Color textGrayColorWith(bool isDarkMode) => MyColors.app898989;

  ///阴影颜色
  static Color get shadowColor => ThemConfig.isDarkMode ? Color.fromRGBO(255, 255, 255, 0.2) : Color.fromRGBO(0, 0, 0, 0.1) ;
  static Color shadowColorWith(bool isDarkMode) => isDarkMode ? Color.fromRGBO(255, 255, 255, 0.1) : Color.fromRGBO(0, 0, 0, 0.1)  ;

}

class TextStyles {

  ///主要文字样式
  static TextStyle text(double e ,{bool? isDarkMode}) => TextStyle(
        fontSize: e.sp,
        fontWeight: FontWeight.w400,
        color: (isDarkMode ?? ThemConfig.isDarkMode) ? Colors.white : Colors.black,
  );
  ///主要文字样式
  static TextStyle textBold(double e ,{bool? isDarkMode}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: (isDarkMode ?? ThemConfig.isDarkMode) ? Colors.white : Colors.black,
  );

  ///灰色文字样式
  static TextStyle textGray(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app898989 ,
  );
  ///灰色文字样式
  static TextStyle textGrayBold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.app898989 ,
  );




  // static TextStyle textDark(double e) => textColor83869B(e);
  // static TextStyle textDarkGray(double e) => textColor83869B(e);

  static TextStyle textColor070E38(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app898989 : MyColors.app070E38,
  );

  static TextStyle textColor595757(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app9E9F9F : MyColors.app595757,
  );
  static TextStyle textColorWhite(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white.withValues(alpha: a),
  );
  static TextStyle textColor9FA0A0(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app9FA0A0,
  );
  static TextStyle textColor898989(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app898989,
  );
  static TextStyle textColor666666(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w500,
    color: MyColors.app666666,
  );
  static TextStyle textColor070E38Bold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.app070E38,
  );
  static TextStyle textColor070E38Semibold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.app070E38,
  );
  static TextStyle textColorWhiteMedium(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white.withValues(alpha: a),
    fontFamily: 'PingFang SC'
  );
  static TextStyle textColorFfffff(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle textColorEC6F37(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: MyColors.appEC6F37,
  );
  static TextStyle textColor231815(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app898989 : MyColors.app231815,
  );

//   static TextStyle FFFFFFFFBold(double e) => TextStyle(
//     fontSize: e.sp,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//   );


  static TextStyle textColor000000Bold(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: ThemConfig.isDarkMode ? MyColors.app9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
  );


  static TextStyle sizeAndColor(double e, {double a = 1 ,Color c = Colors.black }) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: c,
    // color: ThemConfig.isDarkMode ? MyColors.app9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
  );

  static TextStyle textColor000000(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w500,
    color: ThemConfig.isDarkMode ? MyColors.app9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
  );
//
//   static TextStyle FFB5B7C9(double e) => TextStyle(
//     fontSize: e.sp,
//     fontWeight: FontWeight.w500,
//     color: MyColors.app_B5B7C9,
//   );
//   static TextStyle FFE5E0FF(double e) => TextStyle(
//     fontSize: e.sp,
//     fontWeight: FontWeight.w500,
//     color: const Color(0xFFE5E0FF),
//   );
//
//   static TextStyle FF1E2158Medium(double e) => TextStyle(
//     fontSize: e.sp,
//     fontWeight: FontWeight.w500,
//     color: const Color(0xFF1E2158),
//     fontFamily: 'PingFang SC'
//   );
//
  static TextStyle textColor83869B(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app83869B,
  );

}

const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
  systemNavigationBarColor: Color(0xFF000000),
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);

const SystemUiOverlayStyle light = SystemUiOverlayStyle(
  systemNavigationBarColor: Color(0xFF000000),
  systemNavigationBarDividerColor: null,
  statusBarColor: null,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);
