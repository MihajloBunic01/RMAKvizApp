class Pitanje{

  final String id; //redni broj

  final String naslov; //samo pitanje

  final Map<String, bool> opcije; //opcije su sacuvane na nacin {'1':true, '2':false}

  Pitanje({
    required this.id,
    required this.naslov,
    required this.opcije,

  });

//toString override-ovanje
@override
String toString(){
  return 'Pitanje(id: $id, naslov: $naslov, opcije: $opcije)';
}


}