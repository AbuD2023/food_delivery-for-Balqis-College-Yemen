package com.mid.food_delivery

import android.os.BatteryManager
import android.content.*
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
// 🔴 MethodChannel
import io.flutter.plugin.common.MethodChannel
// 🔴 EventChannel
import io.flutter.plugin.common.EventChannel
// 🔴 BasicMessageChannel
import io.flutter.plugin.common.BasicMessageChannel
// تحويل String ↔ Binary
import io.flutter.plugin.common.StringCodec

class MainActivity : FlutterActivity() {
    // 🔴 MethodChannel
    private val BATTERY_CHANNEL = "com.mid.food_delivery/native/battery"
    private val GET_BATTERY_METHOD = "getBatteryLevel"
    // 🔴 EventChannel
    private val EVENT_CHANNEL = "com.mid.food_delivery/native/battery_events"
    // 🔴 BasicMessageChannel
    private val MESSAGE_CHANNEL = "com.mid.food_delivery/native/messages"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 🔴 MethodChannel
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            BATTERY_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == GET_BATTERY_METHOD) {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
        // 🔴 BasicMessageChannel
        EventChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            EVENT_CHANNEL
        ).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(
                    arguments: Any?,
                    events: EventChannel.EventSink
                ) {
                    val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                    val batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
                    events.success(batteryLevel)
                }

                override fun onCancel(arguments: Any?) {
                    // Handle cancellation if needed
                }    
            }
        )

        // 🔴 BasicMessageChanne
        val messageChannel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            MESSAGE_CHANNEL,
            StringCodec.INSTANCE
        )

        messageChannel.setMessageHandler { message, reply ->
            // Handle the received message
            // For example, you can send a response back to Flutter
            val response = "Android received: $message" //معالجة الرسالة
            reply.reply(response) //إرسال الرد إلى Flutter
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }
}
