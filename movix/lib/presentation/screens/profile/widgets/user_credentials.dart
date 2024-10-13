import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_sizedboxes.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class UserCredentials extends StatelessWidget {
  const UserCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Arya Wijaya',
          style: AppTxtStyles.montserrat300Grey,
        ),
        AppSizedboxes.h16,
        Text('Awekadesign@gmail.com',style: AppTxtStyles.montRegWhite14,)
      ],
    );
  }
}
