package com.dazhi.scancode

import android.content.Intent
import android.text.TextUtils
import androidx.annotation.NonNull
import com.alibaba.android.arouter.launcher.ARouter
import com.dazhi.libroot.util.RtCmn
import com.dazhi.scan.util.UtScan
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** PluginScanCodePlugin */
class PluginScanCodePlugin : FlutterPlugin, ActivityAware, MethodCallHandler, PluginRegistry.ActivityResultListener {
    private lateinit var channel: MethodChannel
    private var binding: ActivityPluginBinding? = null
    private lateinit var result: Result

    /**
     * 作者：WangZezhi  (2020/11/5  15:16)
     * 功能：接口FlutterPlugin实现
     * 描述：
     */
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        RtCmn.initApp(flutterPluginBinding.applicationContext, false)
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_scan_code")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    /**
     * 作者：WangZezhi  (2020/11/5  15:18)
     * 功能：接口ActivityAware实现
     * 描述：
     */
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.binding = binding
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        if(binding!=null) {
            binding!!.removeActivityResultListener(this)
            binding=null
        }
    }

    // 重新附加到活动以进行配置更改
    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }

    // 从活动中移出以进行配置更改
    override fun onDetachedFromActivityForConfigChanges() {
    }

    /**
     * 作者：WangZezhi  (2020/11/5  15:17)
     * 功能：接口MethodCallHandler实现
     * 描述：
     */
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "gotoScanCode") {
            this.result = result
            if (binding != null) {
                ARouter.getInstance()
                        .build("/scan/ScanActivity")
                        .navigation(binding!!.activity, 66)
            }
        } else {
            result.notImplemented()
        }
    }

    /**
     * 作者：WangZezhi  (2020/11/5  15:17)
     * 功能：接口PluginRegistry.ActivityResultListener实现
     * 描述：
     */
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == 66 && data != null) {
            val scanRet = data.getStringExtra(UtScan.RESULT_CODE)
            if (!TextUtils.isEmpty(scanRet)) {
                result.success(scanRet)
                return true
            }
        }
        result.error("NULL", "The scan result is null", null)
        return false
    }

}
