import 'package:flutter/material.dart';

import '../models/login.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged<Login> onSubmit;

  const LoginForm({super.key, required this.onSubmit});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _submit() {
    widget.onSubmit(
      Login(
        usuario: _usuarioController.text.trim(),
        senha: _senhaController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usuarioController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _senhaController,
          obscureText: true,
          onSubmitted: (_) => _submit(),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot Password'),
        ),
        Center(
          child: SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: _submit,
              child: const Text('Login', style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ],
    );
  }
}
