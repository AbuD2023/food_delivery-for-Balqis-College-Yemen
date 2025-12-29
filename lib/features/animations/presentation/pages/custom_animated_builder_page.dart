import 'package:flutter/material.dart';

class CustomAnimatedBuilderPage extends StatefulWidget {
  final Widget? child;
  const CustomAnimatedBuilderPage({super.key, this.child});

  @override
  State<CustomAnimatedBuilderPage> createState() =>
      _CustomAnimatedBuilderPageState();
}

class _CustomAnimatedBuilderPageState extends State<CustomAnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  // متحكم بالدوران

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    // تشغيل التحريك بشكل متكرر
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controller,

        // الاستماع لقيمة التحريك
        child: widget.child ?? const Icon(Icons.refresh, size: 80),

        // عنصر ثابت لا يُعاد بناؤه
        builder: (context, child) {
          return Transform.rotate(
            angle: controller.value * 6.28,

            // تحويل القيمة إلى زاوية دوران
            child: child,
          );
        },
      ),
    );
  }
}
