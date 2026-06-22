import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/colors_manager.dart';
import '../cubit/main_layout_cubit.dart';
import 'bottom_nav_bar_items.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MainLayoutCubit>(context);
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        height: 80.h,
        margin: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
              4,
                  (index) => InkWell(
                onTap: () {
                  cubit.changeTab(index: index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(BottomNavBarItems.items[index].icon,
                        color: cubit.selectedTab == index
                            ? ColorsManager.blue
                            : ColorsManager.black,
                        size: 35),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      BottomNavBarItems.items[index].label,
                      style: GoogleFonts.roboto(
                          color: cubit.selectedTab == index
                              ? ColorsManager.blue: ColorsManager.black,
                          fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}