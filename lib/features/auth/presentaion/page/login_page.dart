import 'package:flutter/material.dart';

import '../widgets/login_body.dart';
import '../widgets/login_hedar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: MyText(text: 'تسجيل الدخول')),
      body: SingleChildScrollView(
        child: Column(children: [LoginHedar(), LoginBody()]),
      ),
    );
  }
}
