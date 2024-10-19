import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_sizedboxes.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/custom_basic_appbar.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_profile_avatar.dart';
import '../auth/register/widgets/inputs/confirm_pasword_input.dart';
import 'widgets/inputs/email/email_input.dart';
import 'widgets/inputs/fullname/full_name_input.dart';
import 'widgets/inputs/password/password_input.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBasicAppbar(text: AppStrings.editYourProfile),
      body: Padding(
        padding: AppPaddings.all16,
        child: Column(
          children: [
            const GlobalProfileAvatar(),
            AppSizedboxes.h45,
            const FullNameInput(),
            AppSizedboxes.h16,
            const EmailInput(),
            AppSizedboxes.h16,
            const PasswordInput(),
            AppSizedboxes.h16,
            const ConfirmPaswordInput(),
            AppSizedboxes.h25,
            const GlobalButton(text: AppStrings.updateYourProfile,color: AppColors.purple,)
          ],
        ),
      ),
    );
  }
}
