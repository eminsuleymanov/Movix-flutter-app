import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubits/user/user_cubit.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/assets_paths.dart';
import 'global_snackbar.dart';

class GlobalProfileAvatar extends StatelessWidget {
  const GlobalProfileAvatar({
    super.key,
    required this.inEditScreen,
    this.radius,
    this.roundSize,
  });
  final bool inEditScreen;
  final double? radius;
  final double? roundSize;

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserImageUploaded) {
          GlobalSnackbar.show(context, state.message,
              backgroundColor: AppColors.green);
        } else if (state is UserImageUploadedError) {
          GlobalSnackbar.show(context, state.error,
              backgroundColor: AppColors.red);
        } else if (state is UserImageLoading) {
          const CircularProgressIndicator.adaptive();
        }
      },
      builder: (context, state) {
        final localFile = context.read<UserCubit>().profilePhoto.valueOrNull;

        String? remotePhotoUrl;

        if (state is UserSuccess) {
          remotePhotoUrl = state.userModel.photoUrl;
        }
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: radius ?? 50.r,
              child: localFile != null
                  ? ClipOval(
                      child: Image.file(
                        localFile,
                        width: roundSize ?? 100.w,
                        height: roundSize ?? 100.h,
                        fit: BoxFit.cover,
                      ),
                    )
                  : (remotePhotoUrl != null && remotePhotoUrl.isNotEmpty)
                      ? ClipOval(
                          child: Image.network(
                            remotePhotoUrl,
                            width: roundSize ?? 100.w,
                            height: roundSize ?? 100.h,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SvgPicture.asset(
                          AssetsPaths.avatar,
                          width: roundSize ?? 100.w,
                          height: roundSize ?? 100.h,
                        ),
            ),
            if (inEditScreen)
              Positioned(
                bottom: -10,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await userCubit.pickProfilePhoto();
                      if (userCubit.profilePhoto.hasValue) {
                        await userCubit.uploadProfilePhoto();
                      } else {
                        Future.delayed(const Duration(milliseconds: 800),
                            () => userCubit.fetchUserData());
                      }
                    },
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add_circle_outlined,
                      size: 30,
                      color: AppColors.lightBlueGradient1,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
