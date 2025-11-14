import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/core/widgets/custom_my_text.dart';
import 'package:food_delivery/features/auth/presentaion/state/sgin_in_state.dart';

class HomeGreeting extends ConsumerWidget {
  const HomeGreeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstName = ref.watch(firstNameControllerProvider).text;
    final userName = firstName.isNotEmpty ? firstName : 'Guest';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: MyText(
        text: 'Hello $userName, What fruit salad combo do you want today?',
        fontSize: 20,
        color: const Color(0xFF2C2C2C),
        isTitle: true,
      ),
    );
  }
}
