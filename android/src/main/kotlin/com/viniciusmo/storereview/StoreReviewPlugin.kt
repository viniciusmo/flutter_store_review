package com.viniciusmo.storereview

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StoreReviewPlugin : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "store_review")
            channel.setMethodCallHandler(StoreReviewPlugin())
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "requestReview" -> result.success(null)
            "isAvailable" -> result.success(false)
            else -> result.notImplemented()

        }
    }
}
