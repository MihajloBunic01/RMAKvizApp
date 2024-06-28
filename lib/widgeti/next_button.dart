import "package:flutter/material.dart";
import '../konstante.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
       width: double.infinity,
       decoration: BoxDecoration(
       color: svijetla,
       borderRadius: BorderRadius.circular(10.0),  
       ),
       padding: const EdgeInsets.symmetric(vertical: 10.0),
       child: const Text("Sljedece pitanje", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
     
     );
  }
}