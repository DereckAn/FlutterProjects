import 'package:flutter/material.dart';


const starAligment = Alignment.topLeft;
const endAligment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2,{super.key});
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2
        ], begin: starAligment, end: endAligment),
      ),
      child: Center(
        child: Image.asset('assets/images/dice-1.png', width: 200,),),
    );
  }
}
