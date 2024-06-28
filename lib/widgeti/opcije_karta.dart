import 'package:flutter/material.dart';
import '../konstante.dart';

class OpcijaKarta extends StatelessWidget {
  const OpcijaKarta({Key? key, required this.opcija, required this.color}) : super(key: key);
  final String opcija;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          opcija, 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            color: color.red != color.green ? svijetla : Colors.black,
          ),
        ),
      ),
    );
  }
}