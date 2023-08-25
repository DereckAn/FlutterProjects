import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Es statefull porque vamos a cambiar el UI y manejar stados
class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedimage;

  //Este metodo es para abrir la camara y tomar la foto
  void takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      //esto para checar que se tomo una foto
      return;
    }

    setState(() {
      selectedimage = File(pickedImage
          .path); // esto es para transformat el tipo de formato y asignarlo a la variable
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: takePicture,
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
    );

    if (selectedimage != null) {
      content = GestureDetector(
        onTap: takePicture,
        child: Image.file(
          selectedimage!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).colorScheme.onBackground),
        ),
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        child: content);
  }
}
