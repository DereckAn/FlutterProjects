import 'package:flutter/material.dart';

class TwoButtons extends StatelessWidget {
  final void Function(bool) onButtonPressed;
  const TwoButtons(this.onButtonPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widtt = MediaQuery.of(context).size.width;
    final highh = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            height: highh / 10,
            width: widtt / 2,
            child: IconButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => onButtonPressed(false),
              icon: const Icon(Icons.close, size: 50, color: Colors.red),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            height: highh / 10,
            width: widtt / 2,
            child: IconButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => onButtonPressed(true),
              icon:
                  const Icon(Icons.check, size: 50, color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
