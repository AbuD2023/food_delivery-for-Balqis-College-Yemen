// import 'package:flutter/material.dart';
// import 'package:food_delivery/core/widgets/custom_my_text.dart';
// import '../../data/datasources/native_datasource.dart';
// import '../../data/repositories/native_repository_impl.dart';
// import '../../../../core/platform/platform_channels.dart';

// class EventChannelNativePage extends StatefulWidget {
//   const EventChannelNativePage({super.key});

//   @override
//   State<EventChannelNativePage> createState() => _EventChannelNativePageState();
// }

// class _EventChannelNativePageState extends State<EventChannelNativePage> {
//   late NativeRepositoryImpl repository;
//   int? battery;

//   @override
//   void initState() {
//     super.initState();

//     repository = NativeRepositoryImpl(NativeDataSource(PlatformChannels()));

//     repository.watchBatteryLevel().listen((value) {
//       setState(() {
//         battery = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 110,
//       height: 30,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.black, width: 1),
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3), // changes position of shadow
//           ),
//         ],
//         shape: BoxShape.rectangle,
//       ),
//       child: Center(
//         child: MyText(
//           text: battery == null
//               ? 'Waiting for events...'
//               : 'Battery: $battery%',
//           // style: const TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
