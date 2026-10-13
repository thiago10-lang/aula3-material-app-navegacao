class Login {
  final String usuario;
  final String senha;

  const Login({required this.usuario, required this.senha});

  bool get isValido => usuario == 'admin' && senha == '1234';
}
