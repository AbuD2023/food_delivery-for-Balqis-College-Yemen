import 'dart:io';
// لمعرفة نظام التشغيل

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomPlatformUIPage extends StatelessWidget {
  const CustomPlatformUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Platform UI')),

      body: Center(
        child: kIsWeb
            ? TextButton(onPressed: () {}, child: const Text('Web Button'))
            : Platform.isIOS
            // إذا كان النظام iOS
            ? CupertinoButton(
                color: CupertinoColors.activeBlue,
                child: const Text('iOS Button'),
                onPressed: () {},
              )
            // إذا كان Android
            : ElevatedButton(
                onPressed: () {},
                child: const Text('Android Button'),
              ),
      ),
    );
  }
}
