import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final AuthMode _authMode = AuthMode.Login;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 320,
        width: deviceSize.width * .75,
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty || email.contains('@')) {
                    return 'Informe um email válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: _passwordController,
                validator: _authMode == AuthMode.Login
                    ? null
                    : (_password) {
                        final password = _password ?? '';
                        if (password.isEmpty || password.length < 5) {
                          return 'Sua senha não pode ter menos que 5 caracteres';
                        }
                        return null;
                      },
                onSaved: (passoword) =>
                    _authData['passoword'] = passoword ?? '',
              ),
              if (_authMode == AuthMode.Signup)
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirmar Senha',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (_password) {
                      final password = _password ?? '';
                      if (password != _passwordController.text) {
                        return 'Senhas informadas não coferem';
                      }
                      return null;
                    }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 30)),
                child:
                    Text(_authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
