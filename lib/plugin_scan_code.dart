
import 'dart:async';

import 'package:flutter/services.dart';

class PluginScanCode {
  static const MethodChannel _channel =
      const MethodChannel('plugin_scan_code');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('gotoScan');
    return version;
  }
}
