package com.cqzs.flutter.flutter_demo.plugin

import android.app.Activity
import android.content.Intent
import com.cqzs.flutter.flutter_demo.ui.HttpsDemo
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry

/**
 *
 * @Author: GaiQS
 * @E-mail: gaiqs@sina.com
 * @Creation Date: 2019-10-25
 * @Time: 16:44
 * @Modified Date: 2019-10-25
 */
class FlutterPluginOpen private constructor(private val activity: Activity) : MethodChannel.MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == ChannelConfig.OPEN_HTTPS) {
            activity.startActivity(Intent(activity, HttpsDemo::class.java))
            result.success(ChannelConfig.CHANNEL_SUCCESS)
        } else if (call.method == ChannelConfig.OPEN_HTTPS_PARAMS) {
            val vin = call.argument<String>("vin")
            var intent = Intent(activity, HttpsDemo::class.java)
            intent.putExtra("vin", vin)
            activity.startActivity(intent)
            result.success(ChannelConfig.CHANNEL_SUCCESS)
        } else {
            result.notImplemented()
        }
    }

    companion object {
        fun registerWith(registrar: PluginRegistry.Registrar, channel: String) {
            val instance = FlutterPluginOpen(registrar.activity())
            MethodChannel(registrar.messenger(), channel).setMethodCallHandler(instance)
        }
    }

}