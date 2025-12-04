import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/constants/app_them.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/features/home/presentaion/page/home_page.dart';

import 'features/splash/presentaion/page/splash_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// authStateChanges()

  /// يتم إطلاق الأحداث عند حدوث ما يلي:
  // بعد تسجيل المستمع مباشرةً
  // عندما يكون المستخدم مسجّلاً الدخول
  // عندما يسجّل المستخدم الحالي الخروج
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      log(
        'User is currently signed out!',
        name: 'FirebaseAuth: User not found ❌',
      );
    } else {
      for (final providerProfile in user.providerData) {
        // ID of the provider (google.com, apple.com, etc.)
        final provider = providerProfile.providerId;

        // UID specific to the provider
        final uid = providerProfile.uid;

        // Name, email address, and profile photo URL
        final name = providerProfile.displayName;
        final emailAddress = providerProfile.email;
        final profilePhoto = providerProfile.photoURL;
        log('User is signed in!:( $uid)', name: 'main=> providerProfile.uid');
        log(
          'User is signed in!:( $provider)',
          name: 'main=> providerProfile.provider',
        );
        log(
          'User is signed in!:( $name)',
          name: 'main=> providerProfile.displayName',
        );
        log(
          'User is signed in!:( $emailAddress)',
          name: 'main=> providerProfile.emailAddress',
        );
        log(
          'User is signed in!:( $profilePhoto)',
          name: 'main=> providerProfile.profilePhoto',
        );
      }
      log('User is signed in!', name: 'FirebaseAuth: User signed 🤙');
    }
  });

  /// idTokenChanges()

  /// يتم إطلاق الأحداث عند حدوث ما يلي:
  // بعد تسجيل المستمع مباشرةً
  // عندما يكون المستخدم مسجّلاً الدخول
  // عندما يسجّل المستخدم الحالي الخروج
  // عند حدوث تغيير في الرمز المميز للمستخدم الحالي
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });

  /// userChanges()

  /// يتم إطلاق الأحداث عند حدوث ما يلي:
  // بعد تسجيل المستمع مباشرةً
  // عندما يكون المستخدم مسجّلاً الدخول
  // عندما يسجّل المستخدم الحالي الخروج
  // عند حدوث تغيير في الرمز المميز للمستخدم الحالي
  // عند استدعاء الطرق التالية التي توفّرها FirebaseAuth.instance.currentUser:
  // reload()
  // unlink()
  // updateEmail()
  // updatePassword()
  // updatePhoneNumber()
  // updateProfile()
  FirebaseAuth.instance.userChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Food App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(), // الثيم الفاتح
      // darkTheme: darkTheme,   // الثيم الداكن
      themeMode: ThemeMode.light, // يتبع تفضيل جهاز المستخدم
      home: RoutePage(),
    );
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: const Text('Something went wrong')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Loading..."),
                  SizedBox(height: 50),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return const SplashPage();
        }

        // final user = snapshot.data!;
        return HomePage();
      },
    );
  }
}
