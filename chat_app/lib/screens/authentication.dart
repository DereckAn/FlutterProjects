import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final formkey = GlobalKey<FormState>();
  bool isLogin = true;
  var enterEmail = '';
  var enterPass = '';

  void submit() {
    final isValid = formkey.currentState!.validate();

    if (!isValid) {
      return;
    }

    formkey.currentState!.save();
    print(enterEmail);
    print(enterPass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            // ignore: prefer_const_constructors
                            decoration: const InputDecoration(
                                labelText: 'Email Address'),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect:
                                false, // esto es para desactivar la autocorrecion
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Enter a valid email';
                              }
                              return null;
                            }, // para que la primera letra no se ponga como mayuscula.
                            onSaved: (value) {
                              enterEmail = value!;
                            },
                          ),
                          TextFormField(
                            // ignore: prefer_const_constructors
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText:
                                true, // escodne los caracteres meintras el usuario ingresa la contrasena.
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
                                return 'Password must contain at least 6 characters ';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              enterPass = newValue!;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            onPressed: submit,
                            child: Text(isLogin ? 'Login' : 'Sign up'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(isLogin
                                ? 'Create and account.'
                                : 'I already one'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
