import 'package:flutter/cupertino.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/features/auth/presentation/screens/register.dart';

class AppRouter {
  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context) => Register());
        }
    }

    return null;
  }
}
