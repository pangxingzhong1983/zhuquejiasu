import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'styles.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemConfig {
  ///是否为深色模式
  static bool get isDarkMode => Get.isDarkMode;

  /// 正常模式主题设置
  static ThemeData lightTheme = getTheme();

  /// 黑暗模式主题设置
  static ThemeData darkTheme = getTheme(isDarkMode: true);

  static void setTheme(ThemeMode themeMode) {

    changeThemeMode(themeMode: themeMode);
  }

  static ThemeMode getThemeMode() {
    final String theme =  '';
    switch (theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }





  static ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      primaryColor: MyColors.app_main,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        secondary: MyColors.app_main,
        error: isDarkMode ? MyColors.dark_red : MyColors.red,
      ),
      // Tab 指示器颜色迁移至 TabBarThemeData
      tabBarTheme: const TabBarThemeData(
        indicatorColor: MyColors.app_main,
      ),
      // 页面背景色
      scaffoldBackgroundColor: MyColors.bgColorWith(isDarkMode),
      // 主要用于Material背景色
      canvasColor: MyColors.itemBgColorWith(isDarkMode),
      // 文字选择色（输入框选择文字等）
      // textSelectionColor: MyColors.app_main.withAlpha(70),
      // textSelectionHandleColor: MyColors.app_main,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: MyColors.app_main.withAlpha(70),
        selectionHandleColor: MyColors.app_main,
        cursorColor: MyColors.app_main,
      ),
      textTheme: TextTheme(
        // TextField输入文字颜色
        titleMedium: TextStyles.text(14,isDarkMode: isDarkMode),
        // Text文字样式
        bodyMedium: TextStyles.text(14,isDarkMode: isDarkMode),
        titleSmall: TextStyles.text(14,isDarkMode: isDarkMode),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.textGray(14),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: MyColors.iconColorWith(isDarkMode)
        ),
        elevation: 0.0,
        backgroundColor: MyColors.bgColorWith(isDarkMode),
        systemOverlayStyle:
            isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        titleTextStyle: TextStyles.textBold(16,isDarkMode: isDarkMode),
      ),
      dividerTheme: DividerThemeData(
          color: MyColors.dividerColorWith(isDarkMode),
          space: 0.6,
          thickness: 0.6),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      visualDensity: VisualDensity.standard,
    // ThemeData.bottomAppBarTheme 接受不同 Flutter 版本中的不同类型，为兼容性设置为 null
    bottomAppBarTheme: null, // 使用默认颜色以避免兼容性问题
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyColors.bottomAppBarBgColorWith(isDarkMode),
          selectedItemColor: MyColors.app_main,
          unselectedItemColor: isDarkMode ? MyColors.app_A3A3B3 : MyColors.app_595757,
          selectedIconTheme: const IconThemeData(color: MyColors.app_main),
          unselectedIconTheme: IconThemeData(
              color: isDarkMode ? MyColors.app_A3A3B3 : MyColors.app_595757)
      ),
      dividerColor: MyColors.dividerColorWith(isDarkMode),
      iconTheme: IconThemeData(
        color: MyColors.iconColorWith(isDarkMode)
      ),
    );
  }



  ///设置黑暗模式
  static void changeThemeMode({ThemeMode themeMode = ThemeMode.system}) {
    /// 主题类型
    Get.changeThemeMode(themeMode);
  }


}

extension ThemeExtension on BuildContext {
  bool get isDark => ThemConfig.isDarkMode;

  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get dialogBackgroundColor => Theme.of(this).canvasColor;

}
