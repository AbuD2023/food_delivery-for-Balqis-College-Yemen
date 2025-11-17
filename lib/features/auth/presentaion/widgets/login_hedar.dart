import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../onBording/presentaion/widgets/on_bording_hedar.dart';

class LoginHedar extends StatelessWidget {
  const LoginHedar({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBordingHedar(
      // height: MediaQuery.of(context).size.width / 2,
      // width: MediaQuery.of(context).size.width / 2,
      imageSrc: Assets.images.splash.welcome2.path,
    );
  }
}
