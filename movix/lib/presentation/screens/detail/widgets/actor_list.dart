import 'package:flutter/material.dart';

import '../../../../data/models/movie.dart';
import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_txt_styles.dart';
import 'actor_box.dart';

class ActorList extends StatelessWidget {
  const ActorList({
    super.key,
    required this.actors,
  });
  final List<Actor> actors;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.cast,
          style: AppTxtStyles.montserrat500white,
        ),
        AppSizedboxes.h16,
        SizedBox(
          height: 110,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                final actor = actors[idx];
                return ActorBox(actor: actor,);
              },
              separatorBuilder: (ctx, i) => AppSizedboxes.w8,
              itemCount: actors.length),
        ),
      ],
    );
  }
}
