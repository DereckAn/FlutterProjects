import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(

        title: const Text('Authentication'),
      ),
      body: Form(child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top:30, 
                  bottom:20,
                  left: 20, 
                  right: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(padding: const EdgeInsets.all(16),
                  child: Form(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    
                  )),
                  )
                )
              )
            ],

          ),
        )
      ))
    );
  }
}