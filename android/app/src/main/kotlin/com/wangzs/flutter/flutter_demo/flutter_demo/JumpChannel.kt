package com.wangzs.flutter.flutter_demo.flutter_demo

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class JumpChannel(flutterEngine: BinaryMessenger, activity: FlutterActivity): MethodChannel.MethodCallHandler {
    private val batteryChannelName = "samples.flutter.jumpto.android"
    private var channel: MethodChannel

    private var mActivity: FlutterActivity


    init {
        channel = MethodChannel(flutterEngine, batteryChannelName)
        channel.setMethodCallHandler(this)
        mActivity = activity
    }


    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

        if (call.method == "jumpToAndroidPage") {

            var  intent = Intent(mActivity,SecondActivity::class.java)
            mActivity.startActivity(intent)

            result.success("跳转")
        }else if(call.method == "别的method"){
            //处理samples.flutter.jumpto.android下别的method方法

        } else {
            result.notImplemented()
        }
    }

}