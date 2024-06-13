import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movix/utils/constants/app_txt_styles.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.text,
    this.onTap,
    this.gradientColor1,
    this.gradientColor2, this.color,
  });

  final Color? gradientColor1;
  final Color? gradientColor2;
  final Color? color;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 255.w,
        height: 61.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: color == null 
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [gradientColor1!, gradientColor2!],
                )
              : null, 
          color: color, 
        ),
        child: Center(
          child: Text(
            text,
            style: AppTxtStyles.monts18white500,
          ),
        ),
      ),
    );
  }
}
