class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });
}

final UsuarioTeste = UserModel(
  name: "Augusto",
  email: "augustobgalves@gmail.com",
  password: "123456",
);

class UserCadastro {
  static final List<UserModel> users = [];
}
