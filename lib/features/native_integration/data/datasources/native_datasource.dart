import '../../../../core/platform/platform_channels.dart';

class NativeDataSource {
  final PlatformChannels platform;

  NativeDataSource(this.platform);

  // 🔴 MethodChannel
  Future<int> fetchBatteryLevel() {
    return platform.getBatteryLevel();
  }
}
