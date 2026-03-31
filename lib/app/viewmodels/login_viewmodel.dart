import 'package:atividadeavaliativa/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? emailValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Email é obrigatório'),
      Validatorless.email('Digite um email válido'),
    ])(value);
  }

  String? passwordValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('Senha é obrigatório'),
      Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
    ])(value);
  }

  String? login() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return "form_error";

    final email = emailController.text;
    final password = passwordController.text;

    final user = UserCadastro.users.where(
      (u) => u.email == email && u.password == password,
    ).isNotEmpty;

    if (!user) {
      return "Email ou senha inválidos";
    }

    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
