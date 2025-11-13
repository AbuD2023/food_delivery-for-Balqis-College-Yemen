import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_my_text.dart';

class OnBordingContent extends StatelessWidget {
  final String title;
  final String subTitle;
  final double height;
  final String? buttonText;
  final VoidCallback onPressed;
  const OnBordingContent({
    super.key,
    required this.title,
    required this.subTitle,
    this.height = 15,
    this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: MyText(text: title, isTitle: true),
                ),
                SizedBox(height: height),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: MyText(text: subTitle, fontSize: 14),
                ),
              ],
            ),
          ),
          // SizedBox(height: height * 2),
          if (buttonText != null) ...[
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 60,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: MyText(
                    text: buttonText ?? '',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
