import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:atividadeavaliativa/app/views/login_page.dart';
import 'package:atividadeavaliativa/app/views/register_page.dart';

import '../routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage>
{
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.android,
              size: 80,
            ),
            Text(
              "Bem-vindo! Atividade Avaliativa:",
              textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    );
  }
}