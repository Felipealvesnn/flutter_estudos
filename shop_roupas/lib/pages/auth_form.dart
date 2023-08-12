import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

enum AuthMode { Signup, Login }

class auth_form extends StatefulWidget {
  const auth_form({super.key});

  @override
  State<auth_form> createState() => _auth_formState();
}

class _auth_formState extends State<auth_form>
    with SingleTickerProviderStateMixin {
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool _isLoading = false;
  AnimationController? _controller;
  Animation<Size>? _heightAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 310),
      end: Size(double.infinity, 410),
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.linear,
      ),
    );

    _heightAnimation!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
        _controller!.forward();
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
        _controller!.reverse();
      });
    }
  }

  void _showErroDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final provider = Provider.of<Auth>(context, listen: false);
    setState(() => _isLoading = true);
    _formKey.currentState!.save();
    try {
      if (_authMode == AuthMode.Login) {
        await provider.login(
          _authData['email'] ?? '',
          _authData['password'] ?? '',
        );
      } else {
        await provider.signup(
          _authData['email'] ?? '',
          _authData['password'] ?? '',
        );
      }
    } catch (error) {
      setState(() => _isLoading = false);
      _showErroDialog(error.toString());
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
          //height: _isLogin() ? 300 : 410,
          height: _heightAnimation!.value.height ?? (_isLogin() ? 300 : 410),
          width: deviceSize.width * 0.75,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                    onSaved: (newValue) =>
                        _authData['password'] = newValue ?? '',
                    validator: (value) =>
                        value!.length < 5 ? 'Senha muito curta!' : null,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  if (_isSignup())
                    TextFormField(
                      validator: (value) {
                        value != _authData['password']
                            ? 'Senhas são diferentes!'
                            : null;
                      },
                      decoration:
                          const InputDecoration(labelText: 'Confirmar Senha'),
                      obscureText: true,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  const SizedBox(height: 30),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async => await _submit(),
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
      ),
    );
  }
}
