import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(logoPath),
            backgroundColor: ColorsManager.grey,
          ),

          SizedBox(width: 20.w),

          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.blue,
              ),
            ),
          ),

          SizedBox(width: 40.w),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}