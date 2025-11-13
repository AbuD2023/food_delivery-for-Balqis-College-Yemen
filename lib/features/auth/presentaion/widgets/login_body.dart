import 'package:flutter/material.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/core/widgets/custom_text_fild.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final key = GlobalKey<FormState>();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(text: 'What is your firstname?', fontSize: 20),
                  SizedBox(height: 25),
                  CustomTextFild(
                    controller: controller,
                    hintText: 'Ali',
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'This is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!key.currentState!.validate()) {}
                    },
                    child: MyText(
                      text: 'Start Ordering',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
