import 'package:flutter/material.dart';

enum AuthMode { Signup, Login }

class auth_form extends StatefulWidget {
  const auth_form({super.key});

  @override
  State<auth_form> createState() => _auth_formState();
}

class _auth_formState extends State<auth_form> {
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
bool _isLoading = false;
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() => _authMode = AuthMode.Signup);
    } else {
      setState(() => _authMode = AuthMode.Login);
    }
  }
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _isLoading = true);
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      // Provider.of<Auth>(context, listen: false).login(
      //   _authData['email'] ?? '',
      //   _authData['password'] ?? '',
      // );
    } else {
      // Provider.of<Auth>(context, listen: false).signup(
      //   _authData['email'] ?? '',
      //   _authData['password'] ?? '',
      // );
    }
    setState(() => _isLoading = false);
  }

  bool _isLogin() => _authMode == AuthMode.Login;
  bool _isSignup() => _authMode == AuthMode.Signup;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: _isLogin() ? 310 : 400,
          width: deviceSize.width * 0.75,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,

            child: Column(
              children: [
                TextFormField(
                  validator: (value) => value!.isEmpty || !value.contains('@')
                      ? 'Informe um e-mail válido!'
                      : null,
                  onSaved: (newValue) => _authData['email'] = newValue ?? '',
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  onSaved: (newValue) => _authData['password'] = newValue ?? '',
                  validator: (value) =>
                      value!.length < 5 ? 'Senha muito curta!' : null,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  controller: TextEditingController(),
                  keyboardType: TextInputType.emailAddress,
                ),
                if (_isSignup())
                  TextFormField(
                    validator: (value) => value != _authData['password']
                        ? 'Senhas são diferentes!'
                        : null,
                    decoration:
                        const InputDecoration(labelText: 'Confirmar Senha'),
                    obscureText: true,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () => _submit(),
                    child: Text(_isLogin() ? 'Entrar' : 'Registrar'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8.0),
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _switchAuthMode,
                  child: const Text('Criar uma nova conta?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
