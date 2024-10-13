import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movix/utils/constants/app_colors.dart';
import 'package:movix/utils/constants/assets_paths.dart';

class GlobalProfileAvatar extends StatelessWidget {
  const GlobalProfileAvatar({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.r,
            child: SvgPicture.asset(
              AssetsPaths.avatar,
              width: 100.w,
              height: 100.h,
            ),
          ),
          
          Positioned(
            bottom: -10,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_circle_outlined,
                color: AppColors.lightBlueGradient1,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
