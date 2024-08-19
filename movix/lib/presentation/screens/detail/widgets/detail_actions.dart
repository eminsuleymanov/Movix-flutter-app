import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/app_sizedboxes.dart';
import '../../../../utils/constants/app_strings.dart';
import 'detail_action_btn.dart';
import 'movie_trailer_dialog.dart'; 

class DetailActions extends StatelessWidget {
  const DetailActions({super.key, required this.trailerUrl});
  final String trailerUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DetailActionBtn(
          icon: Icons.local_movies_rounded,
          text: AppStrings.trailer,
          onTap: () {
            if (trailerUrl.isEmpty) {
              const snackBar = SnackBar(
                content: Text('Movie trailer not available'),
                backgroundColor: Colors.orange,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              showDialog(
                context: context,
                builder: (context) => MovieTrailerDialog(trailerUrl: trailerUrl),
              );
            }
          },
        ),
        AppSizedboxes.w20,
        DetailActionBtn(
          icon: FontAwesomeIcons.heart,
          text: AppStrings.wishlist,
          onTap: () {
            // Implement wishlist logic.
          },
        ),
      ],
    );
  }
}
