import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/extensions/locale_extension.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.backgroundPrimary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.lightBlueGradient1,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: context.l10n.wishlist,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: context.l10n.profile,
        ),
      ],
    );
  }
}
