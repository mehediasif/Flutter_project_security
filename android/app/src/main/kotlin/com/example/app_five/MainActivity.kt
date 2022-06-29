package com.example.app_five

import android.os.Environment
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterFragmentActivity() {
    private val channel = "externalStorage";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "getExternalStorageDirectory" ->
                    result.success(Environment.getExternalStorageDirectory().toString())
                "getExternalStoragePublicDirectory" -> {
                    val type = call.argument<String>("type")
                    result.success(Environment.getExternalStoragePublicDirectory(type).toString())
                }
                else -> result.notImplemented()
            }
        }

    }

}
