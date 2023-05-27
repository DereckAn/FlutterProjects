import 'package:color_game/components/menu.dart';
import 'package:flutter/material.dart';

const starAligment = Alignment.topLeft;
const endAligment = Alignment.bottomCenter;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color0, this.color1, this.color2,this.color3, this.color4, this.color5, {super.key});
  final Color color0;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final Color color5;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color0, color1, color2, color3, color4 , color5], begin: Alignment.topCenter, end: endAligment),
      ),
      child: const Center(
        child: Menu()
      ),
    );
  }
}
