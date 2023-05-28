import 'package:flutter/material.dart';

class EndGame extends StatelessWidget {
  const EndGame({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
                showModalBottomSheet(backgroundColor: Colors.grey[500],
                    context: context,
                    builder: (context) {
                        return Column(

                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                                ListTile(
                                    leading: Icon(Icons.music_note),
                                    title: Text('Música'),
                                    onTap: () => {}
                                ),
                                ListTile(
                                    leading: Icon(Icons.photo_album),
                                    title: Text('Fotos'),
                                    onTap: () => {}
                                ),
                                ListTile(
                                    leading: Icon(Icons.videocam),
                                    title: Text('Video'),
                                    onTap: () => {}
                                ),
                            ],
                        );
                    }
                );
            },
        );
  }
}