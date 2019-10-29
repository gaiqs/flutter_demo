package com.cqzs.flutter.flutter_demo

import android.os.Bundle
import com.cqzs.flutter.flutter_demo.plugin.ChannelConfig
import com.cqzs.flutter.flutter_demo.plugin.FlutterPluginOpen
import com.cqzs.flutter.flutter_demo.plugin.FlutterPluginTime
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        registerCustomPlugin(this)
    }

    private fun registerCustomPlugin(registrar: PluginRegistry) {
        FlutterPluginOpen.registerWith(registrar.registrarFor(ChannelConfig.CHANNEL_OPEN), ChannelConfig.CHANNEL_OPEN)
        FlutterPluginTime.registerWith(registrar.registrarFor(ChannelConfig.CHANNEL_TIME), ChannelConfig.CHANNEL_TIME)
    }

}
