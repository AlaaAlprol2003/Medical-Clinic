import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final List<String> qualifications;
  final String description;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.qualifications,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 470.h,
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        border: Border.all(color: ColorsManager.black),
      ),
      child: Column(
        children: [
          SizedBox(height: 18.h),

          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            backgroundColor: ColorsManager.white,
            radius: 60.r,
          ),

          Text(
            doctorName,
            style: TextStyle(
              fontSize: 20.sp,
              color: ColorsManager.blue,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 8.h),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...qualifications.map(
                      (qualification) => Text(
                    '$qualification-',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: ColorsManager.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  description,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}