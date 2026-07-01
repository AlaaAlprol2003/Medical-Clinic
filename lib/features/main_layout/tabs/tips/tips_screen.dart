import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/model/tips_details.dart';
import 'package:medical_clinic/core/resources/colors_manager.dart';

import '../../../../core/resources/assets_manager.dart';
import '../home/widgets/custom_appbar.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: CustomAppBar(
        title: 'عيادة د/ رحاب العشري',
        logoPath: ImageAssets.logo,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400.w,
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: heartCategories.length,
              itemBuilder: (context, index) {
                final category = heartCategories[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: selectedCategoryIndex == index
                          ? ColorsManager.blue
                          : ColorsManager.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: Text(
                            category.title,
                            style: TextStyle(
                              color: selectedCategoryIndex == index
                                  ? ColorsManager.white
                                  : ColorsManager.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          category.icon,
                          color: selectedCategoryIndex == index
                              ? ColorsManager.white
                              : ColorsManager.black,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              itemCount: heartCategories[selectedCategoryIndex].tips.length,
              itemBuilder: (context, index) {
                final tip = heartCategories[selectedCategoryIndex].tips[index];
                return Card(
                  color: ColorsManager.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: BorderSide(color: ColorsManager.black, width: 1.w),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tip.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          tip.description,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
