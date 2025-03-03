import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../cubits/login/cubit/login_cubit.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/assets_paths.dart';

class LogViaSocial extends StatelessWidget {
  const LogViaSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            context.read<LoginCubit>().signInWithGoogle();
          },
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
      ],
    );
  }
}
