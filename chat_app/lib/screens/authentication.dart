import 'dart:io';

import 'package:chat_app/widgets/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; //pakete para crear usuarios

final _fireBase = FirebaseAuth.instance;

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
  File? userImageFile;
  var isAuthenticating = false;
  var enterUsername = '';

  void submit() async {
    final isValid = formkey.currentState!.validate();

    if (!isValid || !isLogin && userImageFile == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please pick an image'),
        ),
      );
      return;
    }

    formkey.currentState!.save();

    // print(enterEmail);
    // print(enterPass);

    setState(() {
      isAuthenticating = true;
    });

    if (isLogin) {
      try {
        final userCredentials = await _fireBase.signInWithEmailAndPassword(
            email: enterEmail, password: enterPass);
        print(userCredentials);
        print('you are logged in');
        // Log user in
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication failed'),
          ),
        );
      }
    } else {
      try {
        final userCredentails = await _fireBase.createUserWithEmailAndPassword(
            //Crear usuario
            email: enterEmail,
            password: enterPass);
        // print(userCredentails);

        // Con esta linea estamos creando una variable con el path de firebase que tendra la imagen
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child('${userCredentails.user!.uid}.jpg');

        // Con esta linea estamos subiendo la imagen a firebase
        await storageRef.putFile(userImageFile!);
        final imageURL = await storageRef.getDownloadURL();
        // print(imageURL);

        // Con esta instancia podemos hablar con firebase. Para upload and fetch data.
        // firebase trabaja con collections. Aqui estamos hablando con una collection llamada users. En dado caso que no  ---->  .collection()
        // exista la collection users, firebase la creara automaticamente.
        // Dentro de estas collecion agregaremos un documento con el id del usuario.   ---> .doc(userCredentails.user!.uid)
        //Ahora solo necesitamos decirle a firebase que data sera guardada en el documento  ---> .set(data)
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentails.user!.uid)
            .set({
          'username': enterUsername,
          'email': enterEmail,
          'image_url': imageURL,
        });
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          //...
        }
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication failed'),
          ),
        );
        setState(() {
          isAuthenticating = false;
        });
      }
      // Sign user up
    }
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
                          if (!isLogin)
                            UserImagePicker(
                              imagePickFn: (pickedImage) =>
                                  userImageFile = pickedImage,
                            ),
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
                          // Este textformfield sera para guardar el username
                          if (!isLogin)
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.trim().length < 4) {
                                  return 'Please enter a valid username with at least 4 characters';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                enterUsername = newValue!;
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
                          if (isAuthenticating)
                            const CircularProgressIndicator(),
                          if (!isAuthenticating)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              onPressed: submit,
                              child: Text(isLogin ? 'Login' : 'Sign up'),
                            ),
                          if (!isAuthenticating)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                });
                              },
                              child: Text(isLogin
                                  ? 'Create an account.'
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
