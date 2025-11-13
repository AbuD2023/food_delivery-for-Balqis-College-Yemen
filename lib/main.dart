import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/constans/app_them.dart';

import 'features/splash/presentaion/page/splash_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Food App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(), // الثيم الفاتح
      // darkTheme: darkTheme,   // الثيم الداكن
      themeMode: ThemeMode.light, // يتبع تفضيل جهاز المستخدم
      home: const SplashPage(),
    );
  }
}
