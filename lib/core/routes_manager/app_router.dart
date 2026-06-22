import 'package:flutter/cupertino.dart';
import 'package:medical_clinic/core/routes_manager/app_routes.dart';
import 'package:medical_clinic/features/auth/presentation/screens/login.dart';
import 'package:medical_clinic/features/auth/presentation/screens/register.dart';

import '../../features/main_layout/main_layout.dart';

class AppRouter {
  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context) => Register());
        }

      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => Login());
        }

        case AppRoutes.main_layout:
          {
            return CupertinoPageRoute(builder: (context) => MainLayout());
          }
    }

    return null;
  }
}
