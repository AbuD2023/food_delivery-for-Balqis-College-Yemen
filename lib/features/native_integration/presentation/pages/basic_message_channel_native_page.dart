// import 'package:flutter/material.dart';
// import '../../data/datasources/native_datasource.dart';
// import '../../data/repositories/native_repository_impl.dart';
// import '../../../../core/platform/platform_channels.dart';

// class BasicMessageChannelNativePage extends StatefulWidget {
//   const BasicMessageChannelNativePage({super.key});

//   @override
//   State<BasicMessageChannelNativePage> createState() =>
//       _BasicMessageChannelNativePageState();
// }

// class _BasicMessageChannelNativePageState
//     extends State<BasicMessageChannelNativePage> {
//   late NativeRepositoryImpl repository;
//   String response = 'No response yet';

//   @override
//   void initState() {
//     super.initState();
//     repository = NativeRepositoryImpl(NativeDataSource(PlatformChannels()));
//   }

//   void sendMessage() async {
//     final message = 'Hello from Flutter!';
//     final nativeResponse = await repository.sendMessage(message);
//     setState(() {
//       response = nativeResponse ?? 'No response from native';
//     });
//   }

//   //   void sendMessage() async {
//   //   final reply =
//   //       await repository.sendMessage(
//   //         'Hello from Flutter',
//   //       );
//   //   setState(() {
//   //     response = reply ?? 'No reply';
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('BasicMessageChannel Lab')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(response),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: sendMessage,
//               child: const Text('Send Message'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
