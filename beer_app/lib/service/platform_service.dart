import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PlatformService {
  final String version;
  final bool physicalDevice;

  PlatformService({
    required this.version,
    required this.physicalDevice,
  });

  static bool get isIos => Platform.isIOS;
  static bool get isAndroid => Platform.isAndroid;

  static Future<PlatformService> create() async {
    final pkgInfo = await PackageInfo.fromPlatform();
    if (isIos) {
      final deviceInfo = await DeviceInfoPlugin().iosInfo;
      return PlatformService(
        version: pkgInfo.version,
        physicalDevice: deviceInfo.isPhysicalDevice,
      );
    } else {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      return PlatformService(
        version: pkgInfo.version,
        physicalDevice: deviceInfo.isPhysicalDevice,
      );
    }
  }
}
