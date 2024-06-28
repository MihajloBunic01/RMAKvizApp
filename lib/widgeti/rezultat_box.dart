import 'package:flutter/material.dart';
import '../konstante.dart';

class RezultatBox extends StatelessWidget {
  const RezultatBox({Key? key,
  required this.krajnjiRezultat,
  required this.duzinaPitanja,
  required this.naDodir,
  }) : super(key: key);

  final int krajnjiRezultat;
  final int duzinaPitanja;
  final VoidCallback naDodir;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: pozadina,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rezultat', style: TextStyle(color: svijetla, fontSize: 22.0),),
            const SizedBox(height: 20.0,),
            CircleAvatar(
              child: Text('$krajnjiRezultat/$duzinaPitanja', 
              style: const TextStyle(
                fontSize: 30.0,
              ),),
              radius: 70.0,
              backgroundColor: krajnjiRezultat == duzinaPitanja / 2
              ? Colors.yellow
              : krajnjiRezultat < duzinaPitanja / 2
                ? netacno
                : tacno,
            ),
            const SizedBox(height: 20.0,),
            Text(krajnjiRezultat == duzinaPitanja / 2
              ? 'Blizu'
              : krajnjiRezultat < duzinaPitanja / 2
                ? 'Pokusajte ponovo'
                : 'Odlicno!',
              style: TextStyle(color: svijetla),
            ),
            const SizedBox( height: 25.0),
            GestureDetector(
              onTap: naDodir,
              child: const Text(
                'Pocni ispocetka',
                style: TextStyle(color: Colors.blue,
                fontSize: 20.0,
                letterSpacing: 1.0
                ),
              ),
            )
             
            

        ],),
      ),
    );
  }
}