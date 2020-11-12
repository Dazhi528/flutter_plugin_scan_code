
import 'dart:async';

import 'package:flutter/services.dart';

class PluginScanCode {
  static const MethodChannel _channel =
      const MethodChannel('plugin_scan_code');

  static Future<String> get scanCodeResult async {
    return await _channel.invokeMethod('gotoScanCode');
  }

}
