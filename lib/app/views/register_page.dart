import 'package:flutter/material.dart';
import 'package:atividadeavaliativa/app/viewmodels/register_viewmodel.dart';

import 'package:atividadeavaliativa/app/views/home_page.dart';
import 'package:atividadeavaliativa/app/views/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterViewmodel viewModel;
  
  @override
  void initState() {
    super.initState();
    viewModel = RegisterViewmodel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel, 
      builder: (_, __){
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /*const SizedBox(
                          height: 30,
                        ),*/
                        Icon(
                          Icons.account_circle,
                          size: 80,
                        ),
                        /*const Text(
                          "Bem-vindo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Crie sua conta para continuar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          controller: viewModel.nomeController,
                          keyboardType: TextInputType.text,
                          validator: viewModel.nomeValidator,
                          decoration: const InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: viewModel.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: viewModel.emailValidator,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: viewModel.passwordController,
                          obscureText: viewModel.obscurePassword,
                          validator: viewModel.passwordValidator,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              onPressed: viewModel.togglePasswordVisibility,
                              icon: Icon(
                                viewModel.obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: viewModel.isLoading ? null : () {
                              final error = viewModel.register();
                  
                              if (error == "form_error") return;
                  
                              if (error != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error)),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: viewModel.isLoading
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    "Cadastrar-se",
                                    style: TextStyle(color: Colors.white)
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Já tem uma conta?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => LoginPage())
                                );
                              },
                              child: const Text("Faça Login"),
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                )
              )
            ),
          )
        );
      }
    );
  }
}
