import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            }, 
            icon:  Icon(Icons.logout, )
          )
        ],
        title: const Text('Chat'),
      ),
      body: const Center(
        child: Text('Chat'),
      )
    );
  }
}