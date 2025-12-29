import 'package:flutter/material.dart';
// استيراد Flutter

class CustomExplicitAnimationPage extends StatefulWidget {
  final Widget? child;
  const CustomExplicitAnimationPage({super.key, this.child});

  @override
  State<CustomExplicitAnimationPage> createState() =>
      _CustomExplicitAnimationPageState();
}

class _CustomExplicitAnimationPageState
    extends State<CustomExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  // mixin ضروري للتحكم بالإطارات (frames)

  late AnimationController controller;
  // المتحكم الرئيسي بالتحريك

  late Animation<double> scaleAnimation;
  // Animation من نوع double لتغيير الحجم

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      // ربط التحريك بإطارات الشاشة
      duration: const Duration(milliseconds: 800),
      // مدة التحريك
    );

    scaleAnimation =
        Tween<double>(
          begin: 0.9,

          // بداية الحجم
          end: 1.0,
          // نهاية الحجم
        ).animate(
          CurvedAnimation(
            parent: controller,

            // ربط الـ Tween بالـ Controller
            curve: Curves.elasticOut,
            // شكل الحركة (مطاطية)
          ),
        );
  }

  @override
  void dispose() {
    controller.dispose();
    // تحرير الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          controller.forward(from: 0);
        },
        child: ScaleTransition(
          scale: scaleAnimation,

          // تطبيق التحريك على الحجم
          child:
              widget.child ??
              const Icon(Icons.star, size: 100, color: Colors.amber),
        ),
      ),
    );
  }
}
