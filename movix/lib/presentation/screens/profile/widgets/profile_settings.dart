import 'package:flutter/material.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/dotted_divider.dart';
import 'profile_tile.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileItems = [
      {
        'icon': Icons.person,
        'title': AppStrings.editProfile,
        'onTap': () {},
      },
      {
        'icon': Icons.g_translate_rounded,
        'title': AppStrings.changeLanguage,
        'onTap': () {}
      },
       {
        'icon': Icons.logout_rounded,
        'title': AppStrings.logout,
        'onTap': () {}
      },
    ];
    return Expanded(
      child: ListView.separated(
        itemCount: profileItems.length,
        separatorBuilder: (context, index) => const DottedDivider(),
        itemBuilder: (context, index) {
          final item = profileItems[index];
          return ProfileTile(
            icon: item['icon'],
            title: item['title'],
            onPressed: item['onTap'],
          );
        },
      ),
    );
  }
}
