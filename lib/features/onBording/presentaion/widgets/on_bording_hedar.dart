import 'package:flutter/material.dart';

import '../../../../core/constans/app_them.dart';

class OnBordingHedar extends StatelessWidget {
  final String imageSrc;
  final double height;
  final double? width;
  const OnBordingHedar({
    super.key,
    required this.imageSrc,
    this.height = 7.5,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(bottom: height * 3, top: height * 6),
        decoration: BoxDecoration(color: AppTheme.accent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                imageSrc,
                width: width ?? MediaQuery.of(context).size.width - 15,
                height: width ?? MediaQuery.of(context).size.width - 15,
              ),
            ),
            SizedBox(height: height),
            Image.asset(
              imageSrc,
              color: AppTheme.shadow,
              width: width ?? MediaQuery.of(context).size.width - 15,
              height: 15,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
