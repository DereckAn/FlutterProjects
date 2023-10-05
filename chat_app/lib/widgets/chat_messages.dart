import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Estamos accediendo a la collecion que esta en la instancia de firebasefirestore. Y la estamos convirtiendo en un stream
      // Para eso usamos el --> .snapshots()
      // Aqui estamos ordenando como queremos los datos --> .orderBy()
      // Estamos viendo si hay cambios en esa coleccion
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: false).snapshots(),
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
          itemCount: chatDocs.length,

          //Aqui estamos modificando como y que se mostrara en la pantalla. 
          itemBuilder: (ctx, index) => Text(chatDocs[index]['text']),
        );
      },
    );
  }
}
