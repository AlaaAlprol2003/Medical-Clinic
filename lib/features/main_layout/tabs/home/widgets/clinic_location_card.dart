import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class ClinicLocationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String address;
  final VoidCallback onDirectionsPressed;

  const ClinicLocationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.address,
    required this.onDirectionsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 500.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.black),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            child: Image.asset(
              imagePath,
              width: 400.w,
              height: 250.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: ColorsManager.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorsManager.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 6.h),
          ElevatedButton.icon(
            onPressed: onDirectionsPressed,
            icon: Icon(
              Icons.directions,
              color: ColorsManager.white,
            ),
            label: Text(
              "إفتح الاتجاهات",
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}