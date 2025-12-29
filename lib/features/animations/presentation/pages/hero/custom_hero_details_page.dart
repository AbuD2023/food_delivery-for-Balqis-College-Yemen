import 'package:flutter/material.dart';

class CustomHeroDetailsPage extends StatelessWidget {
  const CustomHeroDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: const Hero(
          tag: 'hero-image',

          // نفس الـ tag للانتقال السلس
          child: FlutterLogo(size: 250),
        ),
      ),
    );
  }
}
