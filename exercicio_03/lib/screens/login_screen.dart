import 'package:flutter/material.dart';

import '../models/login.dart';
import '../widgets/login_form.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _autenticar(BuildContext context, Login login) {
    if (login.isValido) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Falha no login: usuário ou senha inválidos')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 50, height: 50),
                  const SizedBox(width: 8),
                  const Text(
                    'Flutter',
                    style: TextStyle(fontSize: 36, color: Colors.black54),
                  ),
                ],
              ),
            ),
            LoginForm(onSubmit: (login) => _autenticar(context, login)),
            const SizedBox(height: 130),
            const Text('New User? Create Account'),
          ],
        ),
      ),
    );
  }
}
