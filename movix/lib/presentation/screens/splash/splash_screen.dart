import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/routes/generator.dart';
import '../../../utils/constants/assets_paths.dart';
import '../home/home_view.dart';
import '../onboard/onboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      final authBox = Hive.box('auth');
      if (context.mounted) {
        if (authBox.isNotEmpty) {
          Navigate.replace(context, const HomeView());
        } else {
          Navigate.replace(context, const OnboardScreen());
        }
      }
    });
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AssetsPaths.appLogo),
      ),
    );
  }
}
