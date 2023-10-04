import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var messageController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Recuerda hacerle dispose al controlador para que no se quede en memoria y no se llene
    messageController.dispose();
  }

  void submitMessage(){
    final message = messageController.text;
    if(message.trim().isEmpty){
      return;
    }
    //Aqui se envia el mensaje

    //To reset the input field
    messageController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(children: [
         Expanded(child: TextField(
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
