import 'package:flutter/material.dart';

class ButtonG extends StatelessWidget {
  const ButtonG(this.text1, this.text2, {super.key});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    final highh = MediaQuery.of(context).size.height;
    final widtt = MediaQuery.of(context).size.width;

    return SizedBox(
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
          Navigator.pushNamed(context, text2);
        },
        child:  Text(
          text1,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w900,
              fontSize: 16),
        ),
      ),
    );
  }
}
