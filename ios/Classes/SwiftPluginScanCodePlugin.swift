import Flutter
import UIKit
import ScanCode

public class SwiftPluginScanCodePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "plugin_scan_code", binaryMessenger: registrar.messenger())
        let instance = SwiftPluginScanCodePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if("gotoScanCode"==call.method) {
            let mScanViewController = ScanViewController()
            if #available(iOS 13.0, *) {
                mScanViewController.modalPresentationStyle = .fullScreen
            }
            weak var weakSelf = self
            mScanViewController.mScanBlockCallback = {
                (scanCodeResult:String) in
                result(scanCodeResult)
            }
            let sharedViewController =  UIApplication.shared.keyWindow?.rootViewController
            sharedViewController?.present(mScanViewController, animated: true, completion: nil)
            return
        }
        result(FlutterMethodNotImplemented)
    }
}
