import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setupNotification() async {
    final firebase = FirebaseMessaging.instance;
    await firebase.requestPermission();
    // note Esto es para tener la direccion del dispositivo 
    // note Necesitamos esta direccion para poder enviar notificaciones a un dispositivo en especifico
    final token = await firebase.getToken(); 
    print(token); // Podemos mandar este token a una base de datos via http or firebase sdk
  }

  // note NO pongas async en el initState. No es recomendable porque es un metodo interno the flutter
  @override
  void initState() {
    super.initState();
    setupNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
        title: const Text('Chat'),
      ),
      body: const Column(
        children: [Expanded(child: ChatMessages()), NewMessage()],
      ),
    );
  }
}
