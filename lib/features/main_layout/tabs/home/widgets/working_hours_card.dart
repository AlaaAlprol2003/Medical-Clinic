import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class WorkingHoursCard extends StatelessWidget {
  final String title;
  final String days;
  final String time;
  final String phoneNumber;

  const WorkingHoursCard({
    super.key,
    required this.title,
    required this.days,
    required this.time,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ColorsManager.black),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
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
                    fontSize: 20.sp,
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(
                  Icons.access_time_rounded,
                  color: ColorsManager.white,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'الأيام : $days',
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorsManager.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'المواعيد : $time',
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorsManager.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'رقم العيادة : $phoneNumber',
              style: TextStyle(
                fontSize: 18.sp,
                color: ColorsManager.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}