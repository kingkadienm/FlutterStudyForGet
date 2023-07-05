package com.wangzs.flutter.flutter_demo.flutter_demo

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //跳转到原生Android页面
        JumpChannel(flutterEngine.dartExecutor.binaryMessenger,this)

    }

}
