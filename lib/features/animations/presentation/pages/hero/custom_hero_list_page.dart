import 'package:flutter/material.dart';
import 'custom_hero_details_page.dart';

class CustomHeroListPage extends StatelessWidget {
  const CustomHeroListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero List')),

      body: Center(
        child: GestureDetector(
          // التقاط النقر
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CustomHeroDetailsPage()),
            );
          },

          child: const Hero(
            tag: 'hero-image',

            // معرف مشترك بين الصفحتين
            child: FlutterLogo(size: 120),
          ),
        ),
      ),
    );
  }
}
