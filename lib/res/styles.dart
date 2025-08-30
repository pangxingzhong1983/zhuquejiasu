
import 'package:fl_clash/res/them_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyColors {

  static const Color app_main = Color(0xFFEC6F36);

  static const Color red = Color(0xFFFF4759);
  static const Color dark_red = Color(0xFFE03E4E);

  static const Color text_disabled = Color(0xFFD4E2FA);
  static const Color dark_text_disabled = Color(0xFFCEDBF2);

  static const Color button_disabled = Color(0xFF96BBFA);
  static const Color dark_button_disabled = Color(0xFF83A5E0);

  static const Color unselected_item_color = Color(0xffbfbfbf);
  static const Color dark_unselected_item_color = Color(0xFF4D4D4D);

  static const Color gradient_blue = Color(0xFF5793FA);
  static const Color shadow_blue = Color(0x805793FA);
  static const Color orange = Color(0xFFFF8547);

  static const Color app_595757 = Color(0xFF595757);
  static const Color app_5BB975 = Color(0xFF5BB975);
  static const Color app_D7000F = Color(0xFFD7000F);
  static const Color app_070E38 = Color(0xFF070E38);
  static const Color app_83869B = Color(0xFF83869B);
  static const Color app_E6E7EB = Color(0xFFE6E7EB);
  static const Color app_9FA0A0 = Color(0xFF9FA0A0);
  static const Color app_F7EFCD = Color(0xFFF7EFCD);
  static const Color app_EFEFEF = Color(0xFFEFEFEF);
  static const Color app_F4F6F9 = Color(0xFFF4F6F9);
  static const Color app_C9CACA = Color(0xFFC9CACA);
  static const Color app_EDEDED = Color(0xFFEDEDED);
  static const Color app_999999 = Color(0xFF999999);
  static const Color app_898989 = Color(0xFF898989);
  static const Color app_FDD469 = Color(0xFFFDD469);
  static const Color app_7FC377 = Color(0xFF7FC377);
  static const Color app_D3D5D6 = Color(0xFFD3D5D6);
  static const Color app_E5EDFF = Color(0xFFE5EDFF);
  static const Color app_666666 = Color(0xFF666666);
  static const Color app_F53F3F = Color(0xFFF53F3F);
  static const Color app_3AB787 = Color(0xFF3AB787);
  static const Color app_F7F7FF = Color(0xFFF7F7FF);
  static const Color app_3E3A39 = Color(0xFF3E3A39);
  static const Color app_F9ECD5 = Color(0xFFF9ECD5);
  static const Color app_FBEEE1 = Color(0xFFFBEEE1);
  static const Color app_D1F5EE = Color(0xFFD1F5EE);
  static const Color app_EAEAEA = Color(0xFFEAEAEA);
  static const Color app_E1E1E1 = Color(0xFFE1E1E1);
  static const Color app_EC6F37 = Color(0xFFEC6F37);
  static const Color app_F2F5F8 = Color(0xFFF2F5F8);
  static const Color app_C8C9C9 = Color(0xFFC8C9C9);
  static const Color app_FED426 = Color(0xFFFED426);
  static const Color app_EBEDEF = Color(0xFFEBEDEF);
  static const Color app_9E9F9F = Color(0xFF9E9F9F);
  static const Color app_191A39 = Color(0xFF191A39);
  static const Color app_DDD9EC = Color(0xFFDDD9EC);
  static const Color app_434480 = Color(0xFF434480);
  static const Color app_8D8ABD = Color(0xFF8D8ABD);
  static const Color app_EC6F36 = Color(0xFFEC6F36);
  static const Color app_807FB1 = Color(0xFF807FB1);
  static const Color app_02002E = Color(0xFF02002E);
  static const Color app_231815 = Color(0xFF231815);
  static const Color app_1B1A43 = Color(0xFF1B1A43);
  static const Color app_A3A3B3 = Color(0xFFA3A3B3);

  static Color get searchBgColor =>
      ThemConfig.isDarkMode ? Color.fromRGBO(255, 255, 255, 0.06) :  Color.fromRGBO(0, 0, 0, 0.06);

  ///线条颜色
  static Color get dividerColor => ThemConfig.isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06);
  static Color dividerColorWith(bool isDarkMode) => isDarkMode ? Colors.white.withValues(alpha: 0.06) : Colors.black.withValues(alpha: 0.06);

  ///背景颜色
  static Color get bgColor => ThemConfig.isDarkMode ? MyColors.app_02002E : MyColors.app_EFEFEF;
  static Color bgColorWith(bool isDarkMode)  => isDarkMode ? MyColors.app_02002E : MyColors.app_EFEFEF;

  static Color get bgColor1 => ThemConfig.isDarkMode ? MyColors.app_02002E : MyColors.app_F4F6F9;

  static Color get bgColor2 => ThemConfig.isDarkMode ? MyColors.app_1B1A43 : const Color(0xfff8f8f8);

  ///item背景颜色
  static Color get itemBgColor => ThemConfig.isDarkMode ? Colors.black.withValues(alpha: 0) : Colors.white.withValues(alpha: 0.06);
  static Color itemBgColorWith(bool isDarkMode)  => isDarkMode ? Colors.black.withValues(alpha: 0.7) : Colors.white.withValues(alpha: 0.7);

  ///底部bar
  static Color get bottomAppBarBgColor => ThemConfig.isDarkMode ? MyColors.app_1B1A43 : MyColors.app_EAEAEA;
  static Color bottomAppBarBgColorWith(bool isDarkMode) => isDarkMode ? MyColors.app_1B1A43 : MyColors.app_EAEAEA;

  ///返回按钮颜色
  static Color get backButtonColor => ThemConfig.isDarkMode ? Colors.white : Colors.black;
  static Color backButtonColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black;

  ///按钮默认白色背景色
  static Color get btnFFFColor => ThemConfig.isDarkMode ? Colors.white.withValues(alpha: 0.3) : Colors.white;
  static Color btnFFFColorWith(bool isDarkMode) => isDarkMode ? Colors.white.withValues(alpha: 0.3) : Colors.white;

  ///icon颜色
  static Color get iconColor => ThemConfig.isDarkMode ? MyColors.app_8D8ABD : MyColors.app_EC6F36;
  static Color iconColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black;


  ///主要文字
  static Color get textColor => ThemConfig.isDarkMode ? Colors.white : Colors.black ;
  static Color textColorWith(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black ;

  ///灰色文字
  static Color get textGrayColor => MyColors.app_898989;
  static Color textGrayColorWith(bool isDarkMode) => MyColors.app_898989;

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
    color: MyColors.app_898989 ,
  );
  ///灰色文字样式
  static TextStyle textGrayBold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.app_898989 ,
  );




  // static TextStyle textDark(double e) => FF83869B(e);
  // static TextStyle textDarkGray(double e) => FF83869B(e);

  static TextStyle FF070E38(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app_898989 : MyColors.app_070E38,
  );

  static TextStyle FF595757(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app_9E9F9F : MyColors.app_595757,
  );
  static TextStyle FFFFFFFF(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white.withValues(alpha: a),
  );
  static TextStyle FF9FA0A0(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app_9FA0A0,
  );
  static TextStyle FF898989(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app_898989,
  );
  static TextStyle FF666666(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w500,
    color: MyColors.app_666666,
  );
  static TextStyle FF070E38Bold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.app_070E38,
  );
  static TextStyle FF070E38Semibold(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: MyColors.app_070E38,
  );
  static TextStyle FFFFFFFFMedium(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white.withValues(alpha: a),
    fontFamily: 'PingFang SC'
  );
  static TextStyle FFFFFFF(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle FFEC6F37(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: MyColors.app_EC6F37,
  );
  static TextStyle FF231815(double e) => TextStyle(
    fontSize: e,
    fontWeight: FontWeight.w400,
    color: ThemConfig.isDarkMode ? MyColors.app_898989 : MyColors.app_231815,
  );

//   static TextStyle FFFFFFFFBold(double e) => TextStyle(
//     fontSize: e.sp,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//   );


  static TextStyle FF000000Bold(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: ThemConfig.isDarkMode ? MyColors.app_9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
  );


  static TextStyle sizeAndColor(double e, {double a = 1 ,Color c = Colors.black }) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w600,
    color: c,
    // color: ThemConfig.isDarkMode ? MyColors.app_9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
  );

  static TextStyle FF000000(double e, {double a = 1}) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w500,
    color: ThemConfig.isDarkMode ? MyColors.app_9E9F9F.withValues(alpha: a) : Colors.black.withValues(alpha: a),
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
  static TextStyle FF83869B(double e) => TextStyle(
    fontSize: e.sp,
    fontWeight: FontWeight.w400,
    color: MyColors.app_83869B,
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

