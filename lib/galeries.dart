import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stagiaire/GaleriesMenu/videos.dart';
import 'package:flutter/material.dart';
import 'package:stagiaire/swipe.dart';



main() {
  runApp(MaterialApp(
    home: Galeries(),
    debugShowCheckedModeBanner: false,
  ));
}


class Galeries extends StatefulWidget {
  @override
  _GaleriesState createState() => _GaleriesState();
}

class _GaleriesState extends State<Galeries> {
  List<String> photoActivity = [
    "Photos",
    "Vidéos"
  ];

  int _selectedIndex = 0;
  final _widgetOptions = [
    Photos(),
    Videos(),
  ];

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        initialIndex: 0,
        items: <Widget>[
          Icon(Icons.photo, size: 30),
          Icon(Icons.video_library, size: 30),
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


class Videos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String textVideos = "Visualisez quelques vidéos expliquant le fonctionnement d'une PIC."
        "\n\n"
        "En tout cas, c'est mieux que facebook :-) !";


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
                    MaterialPageRoute(builder: (context) => VideosDocumentaire()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text("Vidéos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 10.0),
                        child: Center(
                          child: Text(textVideos,
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


class Photos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    String textPhotos = "Durant le stage, on a eu le temps de se connaitre et tisser des liens d'amitié. "
        "Ces quelques photos ravivent les souvenirs des bons moments de convivialité passés ensemble."
        "\n\n"
        "Bon visionnage...";

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
                    MaterialPageRoute(builder: (context) => Swipe()),
                  );
                },

                color: Colors.transparent,
                child: Container(
                  height: 300.0,
                  width: 200.0,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text("Photos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 10.0),
                        child: Center(
                          child: Text(textPhotos,
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

