import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Video1.dart';
import 'Video2.dart';


void main() {
  runApp(new VideosDocumentaire());
}

class VideosDocumentaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Vidéos de documentation',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: new MyHomePageVideo(),
    );
  }
}


class MyHomePageVideo extends StatefulWidget {
  @override
  _VideoState createState() => new _VideoState();
}

class _VideoState extends State<MyHomePageVideo> {
  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["Vidéo 1", "Vidéo 2", "Vidéo 3", "Vidéo 4"];  // List of items

    var myGridView = new GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
              elevation: 30.0,
              margin: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 20.0),
              color: Colors.transparent,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
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
                      borderRadius: new BorderRadius.circular(50.0), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                  ),
                  onPressed: () {

                    if(index == 0){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video1()),
                      );
                    }

                    else if(index == 1){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Video2()),
                      );
                    }

                    else if(index == 2){
                          () async {
                        if (await canLaunch("https://www.facebook.com")) {
                          await launch("https://www.facebook.com");
                        };
                      };
                    }

                    else {
                      canLaunch('https://www.facebook.com');
                    }

                  },

                  color: Colors.transparent,
                  child: Text(
                    spacecrafts[index],
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Raleway',
                      fontSize: 14.0,
                    ),
                  ),
                ),
              )
          ),
        );
      },
    );


    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: new Text("Vidéos de documentation", textAlign: TextAlign.justify),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),

          body: myGridView
      ),
    );
  }
}






/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Scaffold(
    body: Center(
      child: RaisedButton(
        onPressed: _launchURL,
        child: Text('Show Flutter homepage'),
      ),
    ),
  ));
}

_launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

*/

/* OR THIS
new FlatButton(
  textColor: style.mainTheme.accentColor,
  child: new Text(signInLabel, style: style.largeText),
  onPressed: () {
    UrlLauncher.launch('http://www.webpage.com');
  }
);
*/
