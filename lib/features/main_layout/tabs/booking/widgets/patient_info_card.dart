import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class PatientInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const PatientInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.blue,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(icon, color: ColorsManager.blue),
            ],
          ),

          SizedBox(height: 20.h),

          ...children,
        ],
      ),
    );
  }
}