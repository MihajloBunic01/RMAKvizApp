import "package:flutter/material.dart";
import '../konstante.dart';
import '../modeli/model_pitanja.dart';
import '../widgeti/widgetpitanja.dart';
import '../widgeti/next_button.dart';
import '../widgeti/opcije_karta.dart';
import '../widgeti/rezultat_box.dart';
import '../modeli/bp_konekcija.dart';



//kreiranje widgeta pocetne stranice
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var bp = BPkonekcija();

 late Future _pitanja;

 
  Future<List<Pitanje>> getData() async{
    return bp.fetchPitanja();
  }
 
  @override
  void initState(){
    _pitanja = getData();
    super.initState();
  }

  int index = 0;
  
  int rezultat = 0;

  bool pritisnuto = false;

  bool vecOdabrano = false;

  void sljedecePitanje(int duzinaPitanja){
    if(index == duzinaPitanja - 1){
      showDialog(
        context: context,
        barrierDismissible: true, // kada kliknemo van kutije dissmisuje popup kutiju
        builder: (ctx) => RezultatBox(
          krajnjiRezultat:rezultat ,
          duzinaPitanja: duzinaPitanja,
          naDodir: pocniIspocetka,
        ));
    }else{
      //u ovom bloku pitanja zavrsavaju
     
      if(pritisnuto){
        setState(() {
          index++;
          pritisnuto = false;
          vecOdabrano = false;
        });
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Molimo odaberite bilo koju opciju'), 
            behavior: SnackBarBehavior.floating, 
            margin: EdgeInsets.symmetric(vertical: 20.0),)
        );
      }
    }
  }

  void provjeriOdgovorIAzuriraj(bool value){
    if(vecOdabrano){
      return;
    }else{
        if(value == true){
          rezultat++;
        }
        setState(() {
          pritisnuto = true;
          vecOdabrano = true;
        });
    }
  }

  void pocniIspocetka(){
    setState(() {
      index = 0;
      rezultat = 0;
      pritisnuto = false;
      vecOdabrano = false;
    });
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _pitanja as Future<List<Pitanje>>,
      builder: (ctx, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}'),);
          }
          else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Pitanje>;
            return Scaffold(
              backgroundColor: pozadina,
              appBar: AppBar(
                title: const Text("Kviz App", style: TextStyle(color: svijetla)),
                backgroundColor: pozadina,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(padding: const EdgeInsets.all(18.0), child: Text("Rezultat: $rezultat", style: const TextStyle(fontSize: 18.0, color: svijetla), ),),
            
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    //ovdje ide q widget
                    WidgetPitanja(
                      pitanje: extractedData[index].naslov, 
                      indexAction: index, 
                      ukupnoPitanja: extractedData.length
                    ),
                  const Divider(color: svijetla
                  ),
            
                  const SizedBox(height: 25.0,),
                  for(int i = 0; i<extractedData[index].opcije.length; i++)
                    GestureDetector(
                      onTap: () => provjeriOdgovorIAzuriraj(extractedData[index].opcije.values.toList()[i]),
                      child: OpcijaKarta(opcija: extractedData[index].opcije.keys.toList()[i], 
                      color: pritisnuto ? extractedData[index].opcije.values.toList()[i] == true
                      ? tacno
                      : netacno : svijetla,
                      ),
                    ),
                ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => sljedecePitanje(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(
                    
                  ),
                ),
              ) ,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            );
          }
        }
        else
        {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Molimo sacekajte dok se pitanja ucitavaju...',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            )
          );
        }
      return const Center(
        child: Text('Nema podataka'),
      );

      },      
    );
  }
}