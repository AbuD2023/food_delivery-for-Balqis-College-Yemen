import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/features/auth/presentaion/state/sgin_in_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) =>
              Text(ref.watch(firstNameControllerProvider.notifier).state.text),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) => ref
            .read(signInProvider)
            .when(
              data: (data) => Text('${data.firstName}\n${data.pass}'),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => CircularProgressIndicator(),
            ),
      ),
    );
  }
}
