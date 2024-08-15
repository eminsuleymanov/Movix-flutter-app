import 'package:flutter/material.dart';

import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_txt_styles.dart';

class ActorBox extends StatelessWidget {
  const ActorBox({super.key, required this.actor});
  final Actor actor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(actor.img),
          radius: 35,
        ),
        AppSizedboxes.h6,
        SizedBox(
          width: 95,
          child: Text(
            actor.name,
            style: AppTxtStyles.montserratRegularGray,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
