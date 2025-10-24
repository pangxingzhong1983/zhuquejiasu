import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:zhuquejiasu/common/common.dart';
import 'package:zhuquejiasu/enum/enum.dart';
import 'package:zhuquejiasu/models/models.dart';
import 'package:flutter/material.dart';

const appName = "朱雀加速";
const appHelperService = "ZhuqueJiasuHelperService";
const coreName = "clash.meta";
const browserUa =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36";
const packageName = "com.follow.zhuque";
final unixSocketPath = "/tmp/ZhuqueJiasuSocket_${Random().nextInt(10000)}.sock";
const helperPort = 48891;
const helperTag = "2024125";
const baseInfoEdgeInsets = EdgeInsets.symmetric(vertical: 16, horizontal: 16);
const httpTimeoutDuration = Duration(milliseconds: 5000);
const moreDuration = Duration(milliseconds: 100);
const animateDuration = Duration(milliseconds: 100);
const commonDuration = Duration(milliseconds: 300);
const defaultUpdateDuration = Duration(days: 1);
const mmdbFileName = "geoip.metadb";
const asnFileName = "ASN.mmdb";
const geoIpFileName = "GeoIP.dat";
const geoSiteFileName = "GeoSite.dat";
final double kHeaderHeight = system.isDesktop
    ? !Platform.isMacOS
          ? 40
          : 28
    : 0;
const profilesDirectoryName = "profiles";
const localhost = "127.0.0.1";
const clashConfigKey = "clash_config";
const configKey = "config";
const geoLastUpdateKey = "geo_last_update";
const listItemPadding = EdgeInsets.symmetric(horizontal: 16);
const double dialogCommonWidth = 300;
const repository = "pangxingzhong1983/zhuqueJiasu";
const defaultExternalController = "127.0.0.1:23145";
const maxMobileWidth = 600;
const maxLaptopWidth = 840;
const defaultTestUrl = "https://www.gstatic.com/generate_204";
final filter = ImageFilter.blur(
  sigmaX: 5,
  sigmaY: 5,
  tileMode: TileMode.mirror,
);

const navigationItemListEquality = ListEquality<NavigationItem>();
const connectionListEquality = ListEquality<Connection>();
const stringListEquality = ListEquality<String>();
const logListEquality = ListEquality<Log>();
const groupListEquality = ListEquality<Group>();
const externalProviderListEquality = ListEquality<ExternalProvider>();
const packageListEquality = ListEquality<Package>();
const hotKeyActionListEquality = ListEquality<HotKeyAction>();
const stringAndStringMapEquality = MapEquality<String, String>();
const stringAndStringMapEntryIterableEquality =
    IterableEquality<MapEntry<String, String>>();
const delayMapEquality = MapEquality<String, Map<String, int?>>();
const stringSetEquality = SetEquality<String>();
const keyboardModifierListEquality = SetEquality<KeyboardModifier>();

const viewModeColumnsMap = {
  ViewMode.mobile: [2, 1],
  ViewMode.laptop: [3, 2],
  ViewMode.desktop: [4, 3],
};

const defaultPrimaryColor = Colors.brown;

double getWidgetHeight(num lines) {
  return max(lines * 84 + (lines - 1) * 16, 0);
}

final mainIsolate = "ZhuqueJiasuMainIsolate";

final serviceIsolate = "ZhuqueJiasuServiceIsolate";
