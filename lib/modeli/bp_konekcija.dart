import 'package:http/http.dart' as http; 
import './model_pitanja.dart';
import 'dart:convert';

class BPkonekcija{

  final url = Uri.parse(
    'https://kvizapp-9e3c3-default-rtdb.firebaseio.com/pitanja.json');

  Future<List<Pitanje>> fetchPitanja() async {
    return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Pitanje> novaPitanja = [];
      
      data.forEach((key, value){
      var novoPitanje = Pitanje(
        id: key,
        naslov: value['naslov'],
        opcije: Map.castFrom(value['opcije']),
        );
      novaPitanja.add(novoPitanje);
    });
    return novaPitanja;
    });

  }
}