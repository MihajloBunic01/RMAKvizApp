import 'package:flutter/material.dart';
import 'stranice/pocetna_stranica.dart'; //fajl sa pocetnom stranicom

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      //uklanjanje debug bannera
        debugShowCheckedModeBanner: false,
      //postavljanje pocetne stranice
        home: HomeScreen(), //kreirano u odvojenom fajlu
    );
  }

}





