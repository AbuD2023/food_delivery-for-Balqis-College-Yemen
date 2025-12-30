import 'package:flutter/services.dart';
import 'platform_channel_names.dart';

class PlatformChannels {
  // 🔴 MethodChannel
  static const MethodChannel _batteryChannel = MethodChannel(
    PlatformChannelNames.batteryChannel,
  );

  // 🔴 MethodChannel Method
  Future<int> getBatteryLevel() async {
    final int level = await _batteryChannel.invokeMethod(
      PlatformChannelNames.getBatteryMethod,
    );
    return level;
  }
}
