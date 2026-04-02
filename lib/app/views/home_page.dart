import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:atividadeavaliativa/app/views/login_page.dart';
import 'package:atividadeavaliativa/app/views/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 80,
            ),
            Text(
              "Usuário Logado com sucesso!",
              textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Seja Bem Vindo",
              textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      )
    );
  }
}