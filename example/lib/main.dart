import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_scan_code/plugin_scan_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _code = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('扫码实例'),
          ),
          body: Center(
              child: Column(
                children: [
                  Spacer(flex: 1,),
                  Text('扫码结果: $_code\n'),
                  Container(
                      margin: EdgeInsets.only(top: 30, bottom: 150),
                      child: RaisedButton(
                        child: Text("点我去扫码"),
                        onPressed: () {
                          setState(() {
                            _code = 'Unknown';
                          });
                          _gotoScanCode();
                        },
                      )),
                ],
              ),
          )
      ),
    );
  }

  // 去扫码
  Future<Void> _gotoScanCode() async {
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
}
