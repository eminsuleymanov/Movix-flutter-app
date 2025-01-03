import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_txt_styles.dart';
import '../../../utils/extensions/locale_extension.dart';
import '../../widgets/global_profile_avatar.dart';
import 'widgets/profile_settings.dart';
import 'widgets/user_credentials.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPrimary,
        automaticallyImplyLeading: false,
        title: Text(
          context.l10n.profile,
          style: AppTxtStyles.montserrat500white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const GlobalProfileAvatar(inEditScreen: false,),
          AppSizedboxes.h20,
          const UserCredentials(),
          AppSizedboxes.h25,
          const ProfileSettings()
        ],
      ),
    );
  }
}
