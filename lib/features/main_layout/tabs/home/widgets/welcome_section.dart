import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';

class WelcomeSection extends StatelessWidget {
  final String userName;
  final String subtitle;

  const WelcomeSection({
    super.key,
    required this.userName,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          " $userName",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: ColorsManager.blue,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 18.sp,
            color: ColorsManager.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}