import 'package:flutter/material.dart';
import 'package:atividadeavaliativa/app/routes/app_routes.dart';

import 'package:atividadeavaliativa/app/views/login_page.dart';
import 'package:atividadeavaliativa/app/views/register_page.dart';
import 'package:atividadeavaliativa/app/views/home_page.dart';
import 'package:atividadeavaliativa/app/views/splash_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.splash: (_) => const SplashPage(),
  };
}
