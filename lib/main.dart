import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_clinic/core/di/service_locator.dart';
import 'package:medical_clinic/core/routes_manager/app_router.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:medical_clinic/features/main_layout/cubit/main_layout_cubit.dart';
import 'package:medical_clinic/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (context) => MainLayoutCubit()),
      ],
      child: MedicalClinic(),
    ),
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
          initialRoute: AppRoutes.login,
          onGenerateRoute: AppRouter.router,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
