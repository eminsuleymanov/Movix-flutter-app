import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/routes/generator.dart';
import '../../../../cubits/user/user_cubit.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/dotted_divider.dart';
import '../../auth/login/login_page.dart';
import '../../change_language/change_lang_screen.dart';
import '../../edit/edit_profile_screen.dart';
import '../../policy/policy_screen.dart';
import 'profile_tile.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});
  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    final List<Map<String, dynamic>> profileItems = [
      {
        'icon': Icons.person,
        'title': AppStrings.editProfile,
        'onTap': () => Navigate.to(context, const EditProfileScreen())
      },
      {
        'icon': Icons.g_translate_rounded,
        'title': AppStrings.changeLanguage,
        'onTap': () => Navigate.to(context, const ChangeLangScreen())
      },
      {
        'icon': FontAwesomeIcons.fileShield,
        'title': AppStrings.policy,
        'onTap': () => Navigate.to(context, const PolicyScreen())
      },
      {
        'icon': Icons.logout_rounded,
        'title': AppStrings.logout,
        'onTap': () async {
          await userCubit.signOut();
          await Hive.box('auth').clear();
          if (context.mounted) {
            Navigate.replace(context, const LoginPage());
          }
        },
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
