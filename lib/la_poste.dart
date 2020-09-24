import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'LaPosteMenu/evolutionlogo.dart';
import 'LaPosteMenu/evolutionslogan.dart';
import 'LaPosteMenu/groupelaposte.dart';
import 'LaPosteMenu/machinesdetri.dart';
import 'LaPosteMenu/saintpriestpic.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    home: LaPoste(),
  ));
}

class LaPoste extends StatefulWidget {
  @override
  _LaPosteState createState() => _LaPosteState();
}

class _LaPosteState extends State<LaPoste> {
  List<String> posteActivity = [
    "Le Groupe",
    "PIC Saint-Priest",
    "Machines et outils",
    "Évolution"
  ];

  int _selectedIndex = 0;
  final _widgetOptions = [
    Groupe(),
    PicSaintPriest(),
    MachineOutils(),
    Evolution(),
  ];

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        initialIndex: 0,
        items: <Widget>[
          Icon(Icons.location_city, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.memory, size: 30),
          Icon(Icons.trending_up, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: _onMonStageTapped,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home.jpg'),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
          heightFactor: 170.0,
        ),
      ),
    );
  }

  void _onMonStageTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


class Groupe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String textGroupe = "La Poste est une des plus vieilles entreprises présentes en France. C’est plus précisément, "
        "l'opérateur courrier historique français des services postaux (courrier et colis) et par ailleurs "
        "le premier opérateur de courrier européen pendant longtemps."
        "\n\n"
        " Avec ses filiales, elle est le deuxième opérateur (en chiffre d'affaires) du colis-express en Europe."
        "\n\n"
        "Découvrez son histoire ...";


    return new Container(
      child: GestureDetector(
        child: Card(
            elevation: 30.0,
            margin: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 20.0),
            color: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
            ),

            child: new Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.indigo, width: 1.0, style: BorderStyle.none)
              ),
              child: FlatButton(
                splashColor: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupeLaPoste()),  /* Pour l'effet Transformer des photos */
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 500.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Le Groupe La Poste",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 10.0),
                        child: Center(
                          child: Text(textGroupe,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 35.0),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}


class PicSaintPriest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textPIC = "Les Plateformes Industrielles Courrier (PIC) sont le plus gros maillon de la chaîne de l'acheminement du courrier en France. "
        "Ces centres du tri ont pour fonction principale de recevoir et de relayer les courriers à l'aide de machines de tri."
        "\n\n"
        " La PIC de Saint-Priest est le centre de tri postal et de "
        "distribution du courrier qui regroupe d'anciens centres de tri des deux "
        "départements : le Rhône et l'Ain.";

    return new Container(
      child: GestureDetector(
        child: Card(
            elevation: 30.0,
            margin: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 20.0),
            color: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
            ),

            child: new Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.indigo, width: 1.0, style: BorderStyle.none)
              ),
              child: FlatButton(
                splashColor: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SaintPriestPIC()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 500.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("PIC Saint-Priest",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 10.0),
                        child: Center(
                          child: Text(textPIC,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 35.0),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}


class MachineOutils extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textMachineOutils = "Les machines de tri industrielles (MTI) sont des machines de tri automatiques qui peuvent "
        "atteindre des performances allant jusqu'à 40000 lettres triées par heure. "
        "\n"
        "Ces machines sont dotées de lecteurs optiques et communiquent avec un système d’information central (Unité de "
        "Reconnaissance d’Adresse, URA) pour identifier et en retour imprimer la destination numérique du courrier."
        "\n\n"
        "Découvrez quelques unes ...";


    return new Container(
      child: GestureDetector(
        child: Card(
            elevation: 35.0,
            margin: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 20.0),
            color: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
            ),

            child: new Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.indigo, width: 1.0, style: BorderStyle.none)
              ),
              child: FlatButton(
                splashColor: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MachinesPIC()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 500.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Les MTIs",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 10.0),
                        child: Center(
                          child: Text(textMachineOutils,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 35.0),
                    ],
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}


class Evolution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textEvolutionLogo = "Le logo de La Poste a beaucoup évolué depuis sa création... Allez découvrir";

    String textEvolutionSlogan = "Dans son histoire, La Poste a arboré près d'une dixaine de slogans "
        "pour rester en phase avec son temps...";


    return new Column(
      children: <Widget>[
        new Container(

          child: GestureDetector(
            child: Card(
                elevation: 25.0,
                margin: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 15.0),
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
                ),

                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.indigo, width: 1.0, style: BorderStyle.none)
                  ),
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EvolutionLogo()),
                      );
                    },

                    color: Colors.transparent,
                    child: Container(
                      height: 150.0,
                      width: 190.0,
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text("Logos historiques",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 5.0),
                            child: Center(
                              child: Text(textEvolutionLogo,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                          new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 27.0),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        ),

        new Container(

          child: GestureDetector(
            child: Card(
                elevation: 25.0,
                margin: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 15.0),
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomLeft: Radius.circular(15.0)),
                ),

                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.indigo, width: 1.0, style: BorderStyle.none)
                  ),
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EvolutionSlogan()),
                      );
                    },

                    color: Colors.transparent,
                    child: Container(
                      height: 150.0,
                      width: 190.0,
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text("Slogans historiques",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0),
                            child: Center(
                              child: Text(textEvolutionSlogan,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ),
                          new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 27.0),
                        ],
                      ),
                    ),
                  ),
                )
            ),
          ),
        )
      ],
    );
  }
}