import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/core/widgets/custom_text_fild.dart';
import 'package:food_delivery/features/auth/presentaion/state/sgin_in_state.dart';

import '../../../homePage/presentaion/page/home_page.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              Consumer(
                builder: (_, ref, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(text: 'What is your firstname?', fontSize: 20),
                      SizedBox(height: 25),
                      CustomTextFild(
                        controller: ref.watch(firstNameControllerProvider),
                        hintText: 'Ali',
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 15),
                      CustomTextFild(
                        controller: ref.watch(passControllerProvider),
                        obscureText: true,
                        hintText: '***',
                        validator: (data) {
                          if (data == null || data.isEmpty) {
                            return 'This is required';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Consumer(
                    builder: (_, ref, _) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                            
                            await ref
                                .read(signInProvider.notifier)
                                .signIn()
                                .then((value) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ),
                                    (route) => false,
                                  );
                                });
                            // await showDialog(
                            //   barrierDismissible: false,
                            //   context: context,
                            //   builder: (context) => AlertDialog(
                            //     title: Center(child: CircularProgressIndicator()),
                            //   ),
                            // ).timeout(
                            //   Duration(seconds: 5),
                            //   onTimeout: () {
                            //     Navigator.of(context).pushAndRemoveUntil(
                            //       MaterialPageRoute(
                            //         builder: (context) => HomePage(),
                            //       ),
                            //       (route) => false,
                            //     );
                            //   },
                            // );
                          }
                        },
                        child: MyText(
                          text: 'Start Ordering',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      );
                    },
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
