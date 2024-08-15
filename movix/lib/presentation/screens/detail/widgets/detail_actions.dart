import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_strings.dart';
import 'detail_action_btn.dart';

class DetailActions extends StatelessWidget {
  const DetailActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DetailActionBtn(
          icon: Icons.local_movies_rounded,
          text: AppStrings.trailer,
          onTap: (){},
        ),
        AppSizedboxes.w20,
        DetailActionBtn(
          icon: FontAwesomeIcons.heart,
          text: AppStrings.wishlist,
          onTap: (){},
        ),
      ],
    );
  }
}
