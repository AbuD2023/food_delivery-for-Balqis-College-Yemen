import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final bool isTitle;
  final String text;
  final double? fontSize;
  final Color? color;
  const MyText({
    super.key,
    required this.text,
    this.fontSize,
    this.isTitle = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      style: isTitle
          ? Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: fontSize, color: color)
          : Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: fontSize, color: color),
    );
  }
}
