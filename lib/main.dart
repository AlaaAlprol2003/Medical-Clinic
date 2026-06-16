import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/routes_manager/app_router.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';

void main() {
  runApp(MedicalClinic());
}

class MedicalClinic extends StatelessWidget {
  const MedicalClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 883),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          initialRoute: AppRoutes.register,
          onGenerateRoute: AppRouter.router,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
