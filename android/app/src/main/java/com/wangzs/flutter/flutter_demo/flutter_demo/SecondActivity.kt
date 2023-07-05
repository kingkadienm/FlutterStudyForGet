package com.wangzs.flutter.flutter_demo.flutter_demo

 import android.app.Activity
 import android.os.Bundle
 import android.widget.Button

class SecondActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
          var testBtn =   findViewById<Button>(R.id.testBtn)

        testBtn.setOnClickListener {

         }
    }
}