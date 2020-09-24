import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stagiaire/DetenteMenu/HangMan/main.dart';

import 'kiffoupas.dart';



main() {
  runApp(MaterialApp(
    home: Loisirs(),
    debugShowCheckedModeBanner: false,
  ));
}


class Loisirs extends StatefulWidget {
  @override
  _LoisirsState createState() => _LoisirsState();
}

class _LoisirsState extends State<Loisirs> {
  List<String> photoActivity = [
    "Le pendu",
    "La Poste Game",
    "Tu kiffes ou pas ?"
  ];

  int _selectedIndex = 0;
  final _widgetOptions = [
    LePendu(),
    PosteGame(),
    Humeur(),
  ];

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        initialIndex: 0,
        items: <Widget>[
          Icon(Icons.format_strikethrough, size: 30),
          Icon(Icons.videogame_asset, size: 30),
          Icon(Icons.thumbs_up_down, size: 30),
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
              image: AssetImage('assets/laposte3.jpg'),
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


class LePendu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String textGroupe = "Jouez au célèbre jeu ¨le pendu¨ avec le jargon postal ..."
        "\n\n"
        "Mais attention, ne vous pendez pas !!";


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
                    MaterialPageRoute(builder: (context) => HangmanPostier()),  /* C'est sensé m'emmener au pendu */
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Le Pendu",
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
                      new Icon(Icons.touch_app, color: Colors.white70, size: 35.0),
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


class PosteGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textPosteGame = "Le jeu postal créé sur la base des activités du Tri grand format. \n\n"
        "Allez ! Que ça dépile et vite ...";

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
                    MaterialPageRoute(builder: (context) => KiffOuPas()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text("La Poste Game",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 10.0),
                        child: Center(
                          child: Text(textPosteGame,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.touch_app, color: Colors.white70, size: 35.0),
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


class Humeur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textHomeur = "Beaucoup de choses se sont passées à la PIC. "
        "Tu as kiffé certains moments et d'autres non !"
        "\n\n"
        "Fais nous savoir ton appréciation générale ici.";

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
                    MaterialPageRoute(builder: (context) => KiffOuPas()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text("Tu as Kiffé ou pas ?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 10.0),
                        child: Center(
                          child: Text(textHomeur,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      new Icon(Icons.touch_app, color: Colors.white70, size: 35.0),
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


