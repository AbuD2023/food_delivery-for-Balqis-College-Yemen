import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/core/widgets/custom_text_fild.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../../data/models/user_sign_in_dtos_model.dart';
import '../state/auth_state.dart'
    show
        firstNameControllerProvider,
        emailControllerProvider,
        phoneNumberControllerProvider,
        ageControllerProvider,
        passControllerProvider,
        signInProvider;

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 2.5,
      child: SingleChildScrollView(
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
                      mainAxisSize: MainAxisSize.min,
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
                          controller: ref.watch(emailControllerProvider),
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'example@example.com',
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
                          controller: ref.watch(phoneNumberControllerProvider),
                          keyboardType: TextInputType.phone,
                          hintText: '+967 777 777 777',
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
                          controller: ref.watch(ageControllerProvider),
                          keyboardType: TextInputType.number,
                          hintText: '23',
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
                        SizedBox(height: 15),
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
                        final signInState = ref.watch(signInProvider);
                        final isLoading = signInState.isLoading;

                        return ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (key.currentState!.validate()) {
                                    final firstName = ref
                                        .read(firstNameControllerProvider)
                                        .text;
                                    final password = ref
                                        .read(passControllerProvider)
                                        .text;
                                    final email = ref
                                        .read(emailControllerProvider)
                                        .text;
                                    final age = ref
                                        .read(ageControllerProvider)
                                        .text;
                                    final phoneNumber = ref
                                        .read(phoneNumberControllerProvider)
                                        .text;

                                    // Show loading dialog
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => const AlertDialog(
                                        title: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    );

                                    // Call sign in
                                    await ref
                                        .read(signInProvider.notifier)
                                        .signIn(
                                          UserSignInDtosModel(
                                            firstName: firstName,
                                            pass: password,
                                            email: email,
                                            age: age,
                                            phoneNumber: phoneNumber,
                                          ),
                                        );

                                    // Close loading dialog
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }

                                    // Check result and navigate
                                    final result = ref.read(signInProvider);
                                    result.when(
                                      data: (user) {
                                        if (context.mounted) {
                                          Navigator.of(
                                            context,
                                          ).pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const CustomDrawer(),
                                              // const HomePage(),
                                            ),
                                            (route) => false,
                                          );
                                        }
                                      },
                                      loading: () {},
                                      error: (error, stackTrace) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text('Error: $error'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : MyText(
                                  text: 'إنشاء حساب',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: MyText(text: 'لدي حساب بالفعل، تسجيل دخول'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
