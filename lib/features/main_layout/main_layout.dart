import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_clinic/features/main_layout/tabs/booking/presentation/booking_screen.dart';
import 'package:medical_clinic/features/main_layout/tabs/home/presentation/home_screen.dart';
import 'package:medical_clinic/features/main_layout/tabs/profile/profile_screen.dart';
import 'package:medical_clinic/features/main_layout/tabs/tips/tips_screen.dart';
import 'package:medical_clinic/features/main_layout/widget/custom_bottom_nav_bar.dart';

import '../../core/resources/colors_manager.dart';
import 'cubit/main_layout_cubit.dart';
import 'cubit/main_layout_state.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final List<Widget> tabs = [
    HomeScreen(),
    BookingScreen(),
    TipsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MainLayoutCubit>(context);
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                backgroundColor: ColorsManager.white,
                  extendBody: true,
                  body: tabs[cubit.selectedTab],
                  bottomNavigationBar: CustomBottomNavBar())
          );
        }
    );
  }
}