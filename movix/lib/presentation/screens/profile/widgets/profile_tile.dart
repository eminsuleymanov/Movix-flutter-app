import 'package:flutter/material.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
  });

  final Function() onPressed;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.blue),
            const SizedBox(width: 16),
            Text(title, style: AppTxtStyles.montRegWhite14)
          ],
        ),
      ),
    );
  }
}
