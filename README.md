# plugin_scan_code

Flutter plugin scan qrcode and barcode(Android and Ios)
可在Android和Ios双系统下使用的扫描二维码和一维码的Flutter插件库

## 引库
dependencies:
    plugin_scan_code: 
  		git: https://github.com/Dazhi528/flutter_plugin_scan_code.git

## 调用方式

```
  import 'package:plugin_scan_code/plugin_scan_code.dart';

  // 去扫码
  _gotoScanCode() async {
    String scanCodeRet;
    try {
      scanCodeRet = await PluginScanCode.scanCodeResult;
    } on PlatformException {
      scanCodeRet = 'Failed to get scan code result.';
    }
    setState(() {
      _code = scanCodeRet;
    });
  }
```
