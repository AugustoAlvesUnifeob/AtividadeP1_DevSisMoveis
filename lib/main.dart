import 'package:atividadeavaliativa/app/views/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Atividade Avaliativa",
      theme: ThemeData(useMaterial3: true),
      home: SplashPage(),
    ),
  );
}

