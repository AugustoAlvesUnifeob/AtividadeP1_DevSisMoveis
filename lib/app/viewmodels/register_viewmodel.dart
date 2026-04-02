import 'package:atividadeavaliativa/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterViewmodel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  String? nomeValidator(String? value) {
    return Validatorless.multiple([
      Validatorless.required('nome é obrigatório'),
      Validatorless.min(3, 'O nome deve ter pelo menos 3 caracteres'),
    ])(value);
  }

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

  String? register() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return "form_error";

    final nome = nomeController.text;
    final email = emailController.text;
    final password = passwordController.text;

    //verifica
    final userExists = UserCadastro.users.any(
      (user) => user.email == email,
    );

    if (userExists) {
      return "Email já cadastrado";
    }

    //cria
    final newUser = UserModel(
      name: nome,
      email: email,
      password: password,
    );

    //salva
    UserCadastro.users.add(newUser);

    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}