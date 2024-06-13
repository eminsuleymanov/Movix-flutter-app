import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/assets_paths.dart';

class LogViaSocial extends StatelessWidget {
  const LogViaSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){},
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.background2,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0), 
              child: SvgPicture.asset(
                AssetsPaths.google,
                width: 40.r,
                height: 40.r,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: (){},
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.background2,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue,
                    size: 40,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
