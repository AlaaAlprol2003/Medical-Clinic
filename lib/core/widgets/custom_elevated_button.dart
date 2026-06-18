import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        backgroundColor: ColorsManager.blue,
        elevation: 4,
        shadowColor: ColorsManager.grey.withValues(alpha: .5)
      ),
      child: Text(
        text,
        style: GoogleFonts.notoSansArabic(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: ColorsManager.white,
        ),
      ),
      
    );
  }
}