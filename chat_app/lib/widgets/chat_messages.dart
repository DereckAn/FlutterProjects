import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      // Estamos accediendo a la collecion que esta en la instancia de firebasefirestore. Y la estamos convirtiendo en un stream
      // Para eso usamos el --> .snapshots()
      // Aqui estamos ordenando como queremos los datos --> .orderBy()
      // Estamos viendo si hay cambios en esa coleccion
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        //aqui estamos haceidno una condicion que si la coneccion esta esperando
        //Mostraremos el circulo de carga
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // aqui estamos haciendo un If para checar si NO tenemos mensajes
        // o si la data es un empty list.
        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages :('),
          );
        }

        // Esto es para chechar si huubo un error en la captura de datos.
        if (chatSnapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        }

        //esto es para calcular los datos. En una lista
        final chatDocs = chatSnapshot.data!.docs;

        // Aqui vamos a mostrar los mensaes como un listview.
        // Generandolos dependiendo el usuario va bajando.
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),

          // Este parametro hace que podamos ver los mensajes de abajo hacia arriba.
          // ? Cambia el orden de los mensajes
          // Tambien debemos cambiar el orden de como llamamos los datos en el stream
          // & linea 14
          reverse: true,
          itemCount: chatDocs.length,

          //Aqui estamos modificando como y que se mostrara en la pantalla.
          itemBuilder: (ctx, index) {
            // ? Toda esta parte es para checar si el mensaje es el primero usuario o no.

            // NOTE: Aqui estamos accediendo a los datos de la coleccion
            // ! si ponemos .data() nos dara un error.
            final chatMessages = chatDocs[index];

            // NOTE: No estoy muy seguro que estamos haciendo aqui.
            // NOTE Creo que estamos accediendo a los datos de la coleccion
            // ! si ponemos .data() nos dara un error.
            final nextChat =
                index + 1 < chatDocs.length ? chatDocs[index + 1] : null;

            final currentMessageUserID = chatMessages['userId'];
            final nextMessageUserID =
                nextChat != null ? nextChat['userId'] : null;

            final nextUserisSame = nextMessageUserID == currentMessageUserID;

            if (nextUserisSame) {
              return MessageBubble.next(
                message: chatMessages['text'],
                isMe: authenticatedUser.uid == currentMessageUserID,
              );
            } else {
              return MessageBubble.first(
                userImage: chatMessages['userImage'],
                message: chatMessages['text'],
                username: chatMessages['username'],
                isMe: authenticatedUser.uid == currentMessageUserID,
              );
            }
          },
        );
      },
    );
  }
}

// ?
// !
// TODO
// *
// NOTE
// &
