import 'package:flutter/material.dart';

import '../widgets/login_hedar.dart';
import '../widgets/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: MyText(text: 'إنشاء حساب')),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [LoginHedar(), SignInBody()]),
          ),
          Positioned(
            top: 40,
            left: 15,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
