package com.cqzs.flutter.flutter_demo.plugin

import android.app.Activity
import android.util.Log
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.PluginRegistry
import io.reactivex.Observable
import io.reactivex.Observer
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import java.util.concurrent.TimeUnit

/**
 *
 * @Author: GaiQS
 * @E-mail: gaiqs@sina.com
 * @Creation Date: 2019-10-28
 * @Time: 16:37
 * @Modified Date: 2019-10-28
 */
class FlutterPluginTime private constructor(private val activity: Activity) : EventChannel.StreamHandler {

    override fun onListen(o: Any?, eventSink: EventChannel.EventSink?) {
        Observable.interval(1000, TimeUnit.MILLISECONDS)
                .subscribeOn(Schedulers.newThread())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(object : Observer<Long> {
                    override fun onNext(t: Long) {
                        eventSink?.success(t.toInt())
                    }

                    override fun onSubscribe(d: Disposable) {
                    }

                    override fun onError(e: Throwable) {
                        eventSink?.error("计时器异常", "异常", e.message)
                    }

                    override fun onComplete() {}
                })
    }

    override fun onCancel(o: Any?) {
        Log.i("FlutterPluginTime", "FlutterPluginTime:onCancel")
    }

    companion object {

        fun registerWith(registrar: PluginRegistry.Registrar, channel: String) {
            val instance = FlutterPluginTime(registrar.activity())
            EventChannel(registrar.messenger(), channel).setStreamHandler(instance)
        }

    }

}
