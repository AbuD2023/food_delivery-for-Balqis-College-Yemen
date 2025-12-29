import 'package:flutter/material.dart';

class CustomAnimatedcontainer extends StatefulWidget {
  final Widget? child;
  final bool isFavorite;
  const CustomAnimatedcontainer({super.key,this.child,required this.isFavorite,});
  @override
  State<CustomAnimatedcontainer> createState() =>_CustomAnimatedcontainerState();
}
class _CustomAnimatedcontainerState extends State<CustomAnimatedcontainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),// مدة التحريك
      curve: Curves.easeInBack,// شكل الحركة (سلسة)
      width: widget.isFavorite ? 250 : 200,// تغيير العرض حسب الحالة
      // height: isFavorite ? 250 : 190,// تغيير الارتفاع حسب الحالة
      decoration: BoxDecoration(
        color: widget.isFavorite ? Color(0xFFFFA451) : null,// تغيير اللون حسب الحالة
        borderRadius: BorderRadius.circular(widget.isFavorite ? 30 : 8),// تغيير حواف الكرت
      ),
      child:widget.child ??const Icon(Icons.flutter_dash, size: 60, color: Colors.white),// أيقونة داخل الكرت
    );
  }
}
