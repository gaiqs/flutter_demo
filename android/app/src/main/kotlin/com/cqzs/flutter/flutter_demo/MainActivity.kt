package com.cqzs.flutter.flutter_demo

import android.os.Bundle
import com.cqzs.flutter.flutter_demo.plugin.*
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
        FlutterPluginAMap.registerWith(registrar.registrarFor(ChannelConfig.CHANNEL_LOCATION), ChannelConfig.CHANNEL_LOCATION)
//        FlutterPluginPermissions.registerWith(registrar.registrarFor(ChannelConfig.CHANNEL_PMSS), ChannelConfig.CHANNEL_PMSS)
    }

}
