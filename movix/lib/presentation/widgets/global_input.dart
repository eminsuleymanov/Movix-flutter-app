import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_txt_styles.dart';

class GlobalInput extends StatefulWidget {
  const GlobalInput({
    super.key,
    this.controller,
    required this.isSecure,
    this.prefixIcon,
    this.suffixIcon,
    this.color,
    this.validate,
    this.onChanged,
    this.onSubmitted,
    required this.label,
  });

  final dynamic controller;
  final bool isSecure;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? color;
  final String label;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  State<GlobalInput> createState() => _GlobalInputState();
}

class _GlobalInputState extends State<GlobalInput> {
  bool show = true;
  void showAndHide() {
    show = !show;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isSecure ? show : false,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: AppTxtStyles.monts20white500,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.all(16),
        label: Text(
          widget.label,
        ),
        floatingLabelStyle: TextStyle(
          color: AppColors.lightBlueGradient1,
          fontSize: 22.sp,
        ),
        labelStyle: TextStyle(color: AppColors.whiteOpacity, fontSize: 16.sp),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteOpacity),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.whiteOpacity,
            ),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightBlueGradient1),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(height: 0),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isSecure
            ? GestureDetector(
                onTap: () => showAndHide(),
                child: Icon(
                  !show ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                  color: AppColors.whiteOpacity,
                  size: 16,
                ),
              )
            : null,
      ),
    );
  }
}
