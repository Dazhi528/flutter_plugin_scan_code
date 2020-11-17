# plugin_scan_code

Flutter plugin scan qrcode and barcode(Android and Ios) </br>
可在Android和Ios双系统下使用的扫描二维码和一维码的Flutter插件库 </br>
扫描核心部分Android和Ios分别基于我开源的另外两个原生库实现,见项目引入部分</br>
目前此库已经可以通过git方式直接引入使用了，作者实际项目中已投入使用，</br>
由于发布到pub需要终端翻墙，而本人平时也就用谷歌插件查查资料，</br>
因此没有专门架梯子，所以打消了发布的pub的念头，目前只支持Git方式引入，</br>
详情如下引库


## 引库

```
dependencies:
    plugin_scan_code: 
  		git: https://github.com/Dazhi528/flutter_plugin_scan_code.git
```

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
