import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/presentation/screens/onboard/onboard_screen.dart';

import '../../../core/routes/generator.dart';
import '../../../utils/constants/assets_paths.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({ super.key });

   @override
   Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigate.to(context, const OnboardScreen());
    });
       return Scaffold(
           body: Center(
            child: SvgPicture.asset(AssetsPaths.appLogo),
           ),
       );
  }
}