import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stagiaire/MonStageMenu/machinesutilisees.dart';

import 'MonStageMenu/journeetype.dart';
import 'MonStageMenu/mesmissions.dart';
import 'MonStageMenu/resumestage.dart';
import 'la_poste.dart';

main() {
  runApp(MaterialApp(
    home: MonStage(),
      debugShowCheckedModeBanner: false,
  ));
}


class MonStage extends StatefulWidget {
  @override
  _MonStageState createState() => _MonStageState();
}

class _MonStageState extends State<MonStage> {
  List<String> stageActivity = [
    "Missions",
    "Machines",
    "JourneeType",
    "Resume du Stage"
  ];

  int _selectedIndex = 0;
  final _widgetOptions = [
    Missions(),
    Machines(),
    UneJourneeType(),
    ResumeStage(),
  ];

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        initialIndex: 0,
        items: <Widget>[
          Icon(Icons.directions_walk, size: 30),
          Icon(Icons.memory, size: 30),
          Icon(Icons.alarm, size: 30),
          Icon(Icons.lightbulb_outline, size: 30),
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
          image: AssetImage('assets/images/home1.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
          heightFactor: 200.0,
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

class Missions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => MesMissions()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 350.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Mes Missions",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 15.0),
                        child: Center(
                          child: Text(
                            "Pendant toute la durée de mon stage, j'ai été affecté à différentes tâches du pôle de tri grand format. "
                                "\n"
                                " Ceci dit, j'ai pu travailler au tri sur machine MTI GF (mon préféré), à la presse (le plus cool) "
                                "et au Brin de rejet (Ouh là ... parfois ça ne blague pas)."
                                "\n\n"
                                "Cliquez pour en savoir plus.",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 50.0),
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

class Machines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => MachinesUtilisees()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 350.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Machines Utilisées",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 0.0, right: 0.0, bottom: 15.0),
                        child: Center(
                          child: Text(
                            "Il est à noter que le travail réalisé dans ce genre de plateforme industrielle est très automatisé. "
                                "Et c'était aussi le cas dans le département où j'exerçais : Le Tri Grand Format."
                                "\n"
                                "Comme outils de travail, j'utilisais principalement 3 machines de pointe."
                                "\n\n"
                                "Cliquez pour découvrir ces 3 merveilles du tri !",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 50.0),
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


class UneJourneeType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => JourneeType()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 350.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Une Journée Type",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 0.0, right: 0.0, bottom: 15.0),
                        child: Center(
                          child: Text(
                            "Je travaillais 7 heures par jour. De lundi à samedi, sauf Mardi et Dimanche qui étaientt mes jours de repos.\n\n"
                                "Mes journées de travail commençaient à 6h et finissaient à 13h... en théorie."
                                "\n\n"
                                "En pratique, on terminait à 12h30 avec deux pauses : une de 10 min à 8h et une de 30min à 9h30.",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 50.0),
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

class ResumeStage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    MaterialPageRoute(builder: (context) => ResumeDuStage()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 350.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Resumé du Stage",
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 0.0, right: 0.0, bottom: 15.0),
                        child: Center(
                          child: Text(
                            "Réaliser ce stage à la PIC de Saint-Priest, m’a permis de découvrir comment fonctionne une"
                              " plateforme industrielle du courrier ainsi que son organisation globale.\n\n"
                            "Mais pas que ... cliquez pour en savoir plus",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 50.0),
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

void customAction() {
  Set();
}
