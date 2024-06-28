import 'package:flutter/material.dart';
import 'package:kviz/konstante.dart';

class WidgetPitanja extends StatelessWidget {
  const WidgetPitanja({
    Key? key, 
    required this.pitanje, 
    required this.indexAction,
    required this.ukupnoPitanja}) : super(key: key);

  final String pitanje;
  final int indexAction;
  final int ukupnoPitanja;



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Pitanje ${indexAction + 1}/$ukupnoPitanja: $pitanje', 
      style: TextStyle(
          fontSize: 24.0,
          color: svijetla,
        ),
      ),
    );
  }
}