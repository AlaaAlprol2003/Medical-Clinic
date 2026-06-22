import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/routes_manager/app_router.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medical_clinic/features/main_layout/cubit/main_layout_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context)=> MainLayoutCubit())
    ], child: MedicalClinic())
    
  );
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
          initialRoute: AppRoutes.main_layout,
          onGenerateRoute: AppRouter.router,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
