import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  //Esta es la variable que almacenara los datos a mandar a firebase
  final messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    //Recuerda hacerle dispose al controlador para que no se quede en memoria y no se llene
    messageController.dispose();
  }

  void submitMessage() async {
    
    final message = messageController.text;
    if (message.trim().isEmpty) {
      return;
    }

     //To reset the input field
    FocusScope.of(context).unfocus(); // Esto es ara quitar el teclado despues de mandar un mensaje
    messageController.clear();

    //Cuidado con FirebaseAuth y FirebaseFirestore. Dos cosas totalmente diferentes
    final user = FirebaseAuth.instance.currentUser!;

    final userImages = await FirebaseFirestore
        .instance //Aqui estamos obteniendo la instancia de firebase
        .collection('users') // Aqui estamos obteniendo la coleccion de usuarios
        .doc(user.uid) // Aqui estamos obteniendo el id del usuario
        .get(); //Esto mando un http request para obtener la informacion
    // .then((value) => value.data()!['image_url']);

    //Aqui se envia el mensaje
    FirebaseFirestore.instance.collection('chat').add({
      'text': message,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      //Recuerda que para tener esta informacion tenemos que jalarla de firebase
      //Aqui estamos accediendo a la tabla de datos en la seccion de username e image_url
      'username': userImages.data()!['username'],
      'userImage': userImages.data()!['image_url'],
    });

   

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: messageController,
          decoration: const InputDecoration(labelText: 'Send a message...'),
          textCapitalization: TextCapitalization.sentences,
          autocorrect: true,
          enableSuggestions: true,
        )),
        IconButton(onPressed: submitMessage, icon: const Icon(Icons.send))
      ]),
    );
  }
}
