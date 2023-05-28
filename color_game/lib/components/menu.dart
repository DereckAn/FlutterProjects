import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final widtt = MediaQuery.of(context).size.width;
    final highh = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text(
        //   'Color Matcher Game $widtt',
        //   style: TextStyle(fontSize: 40),
        // ),
        Image.asset(
          'assets/images/pato.png',
          width: 200,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: highh / 10,
        ),
        SizedBox(
          width: widtt / 1.5,
          height: highh / 17,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 66, 190, 165),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/juego');
            },
            child: const Text(
              'START',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: highh / 60,
        ),
        SizedBox(
          width: widtt / 1.5,
          height: highh / 17,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/records');
            },
            child: const Text(
              'Records',
              style: TextStyle(
                  color: Color.fromARGB(255, 66, 190, 165),
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
