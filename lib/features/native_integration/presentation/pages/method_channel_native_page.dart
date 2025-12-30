import 'package:flutter/material.dart';
import '../../data/datasources/native_datasource.dart';
import '../../data/repositories/native_repository_impl.dart';
import '../../../../core/platform/platform_channels.dart';

class MethodChannelNativePage extends StatefulWidget {
  const MethodChannelNativePage({super.key});

  @override
  State<MethodChannelNativePage> createState() =>
      _MethodChannelNativePageState();
}

class _MethodChannelNativePageState extends State<MethodChannelNativePage> {
  late NativeRepositoryImpl repository;
  int? battery;

  @override
  void initState() {
    super.initState();
    repository = NativeRepositoryImpl(NativeDataSource(PlatformChannels()));
  }

  void loadBattery() async {
    final value = await repository.getBatteryLevel();
    setState(() => battery = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Native Integration')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(battery == null ? 'No Data' : 'Battery: $battery%'),
            ElevatedButton(
              onPressed: loadBattery,
              child: const Text('Get Battery'),
            ),
          ],
        ),
      ),
    );
  }
}
