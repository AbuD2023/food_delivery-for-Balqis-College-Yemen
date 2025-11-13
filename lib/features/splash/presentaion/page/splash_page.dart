import 'package:flutter/material.dart';

import '../../../onBording/presentaion/page/on_bording_page.dart';
import '../widgets/splash_body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the next page or perform any action after the splash screen
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => OnBordingPage()),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashBody();
  }
}
