import 'package:flutter/material.dart';

class CustomAnimatedOpacityAlignPage extends StatefulWidget {
  final bool isVisible;
  final Widget? child;
  const CustomAnimatedOpacityAlignPage({
    super.key,
    required this.isVisible,
    this.child,
  });

  @override
  State<CustomAnimatedOpacityAlignPage> createState() =>
      _CustomAnimatedOpacityAlignPageState();
}

class _CustomAnimatedOpacityAlignPageState
    extends State<CustomAnimatedOpacityAlignPage> {
  @override
  Widget build(BuildContext context) {
    // bool isVisible = false;
    // يتحكم بظهور العنصر ومكانه
    return AnimatedAlign(
      duration: const Duration(milliseconds: 500),

      // مدة تحريك المكان
      alignment: widget.isVisible ? Alignment.center : Alignment.topCenter,

      // تغيير موضع العنصر
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),

        // مدة تحريك الشفافية
        opacity: widget.isVisible ? 1 : 0,

        // 1 = ظاهر ، 0 = مخفي
        child: Center(
          child:
              widget.child ??
              const Icon(Icons.favorite, color: Colors.pink, size: 80),
        ),
      ),
    );
  }
}
