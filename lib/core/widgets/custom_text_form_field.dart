import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.preIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.isSecured = false,
    this.validator,
  });
  final String hint;
  final Widget? preIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool isSecured;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isSecured,
      validator: validator,
      style: GoogleFonts.notoSansArabic(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.black.withValues(alpha: .5),
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: ColorsManager.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        hintText: hint,
        hintTextDirection: TextDirection.rtl,
        hintStyle: GoogleFonts.notoSansArabic(
          color: ColorsManager.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: preIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
