import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/core/widgets/custom_text_fild.dart';
import 'package:food_delivery/features/auth/data/models/user_login_dtos_model.dart';
import 'package:food_delivery/features/auth/presentaion/page/sign_in_page.dart';

import '../../../../core/widgets/custom_drawer.dart';
import '../state/auth_state.dart'
    show
        emailControllerProvider,
        loginProvider,
        obscureTextControllerProvider,
        passControllerProvider;

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
                    ref.read(emailControllerProvider).text = 'abud@example.com';
                    ref.read(passControllerProvider).text = '123456789';
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'What is your Email Address and Password?',
                          fontSize: 20,
                        ),
                        SizedBox(height: 25),
                        CustomTextFild(
                          controller: ref.watch(emailControllerProvider),
                          hintText: 'example@example.com',
                          keyboardType: TextInputType.emailAddress,
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
                          obscureText: ref.watch(obscureTextControllerProvider),
                          hintText: '***',
                          prefixIcon: IconButton(
                            onPressed: () {
                              ref
                                  .read(obscureTextControllerProvider.notifier)
                                  .toggle();
                            },
                            icon: Icon(
                              ref.watch(obscureTextControllerProvider)
                                  ? Icons.remove_red_eye_sharp
                                  : Icons.visibility_off,
                            ),
                          ),
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
                SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Consumer(
                      builder: (_, ref, _) {
                        final signInState = ref.watch(loginProvider);
                        final isLoading = signInState.isLoading;

                        return ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () async {
                                  if (key.currentState!.validate()) {
                                    final password = ref
                                        .read(passControllerProvider)
                                        .text;
                                    final email = ref
                                        .read(emailControllerProvider)
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
                                        .read(loginProvider.notifier)
                                        .login(
                                          UserLoginDtosModel(
                                            pass: password,
                                            email: email,
                                          ),
                                        );

                                    // Close loading dialog
                                    if (context.mounted) {
                                      Navigator.of(context).pop();
                                    }

                                    // Check result and navigate
                                    final result = ref.read(loginProvider);
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
                                  text: 'تسجيل دخول',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                        );
                      },
                    ),
                  ),
                ),
                // SizedBox(height: 15),

                // Center(
                //   child: SizedBox(
                //     width: double.infinity,
                //     height: 60,
                //     child: Consumer(
                //       builder: (_, ref, _) {
                //         final loginWithEmailState = ref.watch(
                //           loginWithEmailProvider,
                //         );
                //         final isLoading = loginWithEmailState.isLoading;
                //         return ElevatedButton.icon(
                //           onPressed: isLoading
                //               ? null
                //               : () async {
                //                   if (key.currentState!.validate()) {
                //                     // Show loading dialog
                //                     showDialog(
                //                       barrierDismissible: false,
                //                       context: context,
                //                       builder: (context) => const AlertDialog(
                //                         title: Center(
                //                           child: CircularProgressIndicator(),
                //                         ),
                //                       ),
                //                     );
                //                     // Call sign in
                //                     await ref
                //                         .read(loginWithEmailProvider.notifier)
                //                         .signInWithEmail();
                //                     // Close loading dialog
                //                     if (context.mounted) {
                //                       Navigator.of(context).pop();
                //                     }
                //                     // Check result and navigate
                //                     final result = ref.read(
                //                       loginWithEmailProvider,
                //                     );
                //                     result.when(
                //                       data: (user) {
                //                         if (context.mounted) {
                //                           Navigator.of(
                //                             context,
                //                           ).pushAndRemoveUntil(
                //                             MaterialPageRoute(
                //                               builder: (context) =>
                //                                   const CustomDrawer(),
                //                               // const HomePage(),
                //                             ),
                //                             (route) => false,
                //                           );
                //                         }
                //                       },
                //                       loading: () {},
                //                       error: (error, stackTrace) {
                //                         if (context.mounted) {
                //                           ScaffoldMessenger.of(
                //                             context,
                //                           ).showSnackBar(
                //                             SnackBar(
                //                               content: Text('Error: $error'),
                //                               backgroundColor: Colors.red,
                //                             ),
                //                           );
                //                         }
                //                       },
                //                     );
                //                   }
                //                 },
                //           icon: Icon(Icons.g_mobiledata),
                //           label: isLoading
                //               ? const CircularProgressIndicator(
                //                   color: Colors.white,
                //                 )
                //               : MyText(
                //                   text: 'تسجيل دخول باستخدام Google',
                //                   fontSize: 18,
                //                   color: Colors.white,
                //                 ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: MyText(text: 'لا امتلك حساب، إنشاء حساب'),
                    ),
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
