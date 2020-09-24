import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stagiaire/Loisirs.dart';
import 'package:stagiaire/galeries.dart';
import 'package:stagiaire/la_poste.dart';
import 'package:stagiaire/mon_stage.dart';

import 'Messagerie/main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      theme: new ThemeData(backgroundColor: Colors.teal),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["La Poste", "Mon Stage", "Galeries", "Détente"];  // List of items
    
    var myGridView = new GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 20.0,
            margin: EdgeInsetsDirectional.fromSTEB(10.0, 70.0, 10.0, 0.0),
            color: Colors.transparent,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100.0),
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
                  borderRadius: new BorderRadius.circular(10.0), side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid)
                ),// Menu buttons Shape
                onPressed: () {

                  if(index == 0){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaPoste()),
                    );
                  }

                  else if(index == 1){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MonStage()),
                    );
                  }

                  else if(index == 2){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Galeries()),
                    );
                  }

                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loisirs()),
                    );
                  }

                },
                  
                color: Colors.transparent,
                child: Text(
                  spacecrafts[index],
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "Raleway",
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
          title: new Text("Steevy Stagiaire", textAlign: TextAlign.justify),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),

        drawer: new InkWellDrawer(),  // JE METS MON DRAWER CUSTOMIZÉ

        body: myGridView
        ),
    );
  }
}

////////////////////////////////////////////////////

class InkWellDrawer extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/ensim2.png'), fit: BoxFit.fill) /* Logo Ensim bleu*/,
                color: Color.fromRGBO(0, 15, 50, 1.0),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage("assets/maphoto.jpg"),
                          fit: BoxFit.cover
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                      ),
                    ),
                    Text('Steevy', style: TextStyle(color: Colors.white, fontSize: 20.0),)
                  ],
                ),
              )),

          CustomListTile(Icons.person, 'Mon Profile', ()=> {
            Navigator.pop(context),
            Navigator.push(context,
                new MaterialPageRoute(builder: (z) => new ProfileView())
            )
          }),

          CustomListTile(Icons.school, 'Mon École', ()=>{
            Navigator.pop(context),
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SchoolView())
            )
          }),

          CustomListTile(Icons.vpn_key, 'Mon stage Ouvrier', ()=>{
            Navigator.pop(context),
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MonStageOuvrier())
            )
          }),

          CustomListTile(Icons.mail, 'Ma Messagerie', ()=>{
            Navigator.pop(context),
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Messagerie())
            )
          }),

          CustomListTile(Icons.help, 'A Propos', ()=>{
            Navigator.pop(context),
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Apropos())
            )
          }),

        ],

      ),
    );
  }
}

class CustomListTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10
        ),
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        child: InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Container(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(icon),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      Text(text, style: TextStyle(
                          fontSize: 16
                      ),),
                    ],),
                    Icon(Icons.arrow_right)
                  ],)
            )
        ),
      ),
    );
  }
}

/// Now, we will add our views: ProfileView and SchoolView etc

class SchoolView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("ENSIM École d'Ingénieurs"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/ensim2.png"), /* A remplacer par le logo de l'Ensim */
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 500.0,
            padding: const EdgeInsets.only(top: 40.0),

            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(70)
            ),

            child: Column(
              children: <Widget>[
                Text("ENSIM École d'Ingénieurs", style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Center(child: Text(
                      "Créée en 1995, l'École Nationale Supérieure d'Ingénieurs du Mans (ENSIM) est l'une des 205 écoles d'ingénieurs françaises accréditées à délivrer un diplôme d'ingénieur. "
                          "\n\n"
                      " L’ENSIM, qui a accueilli sa première promotion en Septembre 1996 est une école d’ingénieurs avec cycle préparatoire intégré et recrutement en 1ère année du cycle d’ingénieur\n\n"
                          "Cette école est originellement spécialisée dans le domaine des vibrations, de l'acoustique et des capteurs. Depuis 2009, elle propose également une spécialité informatique qui "
                          "connaît beaucoup de succès et qui continue de se développer à travers ses deux filiaires : IPS et ASTRE (aucune idée ? ... interroge Google) !\n\n"
                      "Les diplômés de l’ENSIM bénéficient d’une bonne insertion professionnelle.  Près de 80 % des ingénieurs diplômés trouvent un emploi, 6 mois après leur sortie de l’école et près de 100 %, 1 an après\n\n"
                          "Bon je fait un peu de pub là ...",
                      style: TextStyle(color: Colors.black45))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Élève Ingénieur"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/maphoto.jpg"),
                        fit: BoxFit.cover
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 300.0,
            padding: const EdgeInsets.only(top: 40.0),

            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(70)
            ),
            
            child: Column(
              children: <Widget>[
                Text('BOUBALA MOUSSAVOU Steevy', style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Center(child: Text(
                      "Actuellement en 4e année d'école d'ingénieur à l'Ensim, je prépare mon dilpôme d'ingénieur en informatique spécialisé dans les systèmes temps réels et embarqués. "
                          "Je réalise mon stage ouvrier à la PIC de la Poste Saint-Priest."
                          "\n\n"
                          "C'est ma toute première expérience en entreprise en tant que stagiaire ouvrier dans une si grande entreprise industrielle ! (A reformuler)",
                      style: TextStyle(color: Colors.black45))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MonStageOuvrier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Mon stage ouvrier"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/home.jpg"),
                        fit: BoxFit.cover
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 600.0,
            padding: const EdgeInsets.only(top: 40.0),

            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(70)
            ),

            child: Column(
              children: <Widget>[
                Text('Stage Industriel à La Poste', style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Center(child: Text(
                      "Le stage ouvrier est un stage d'immersion en industrie qui a pour objectif de faire découvrir, au futur ingénieur, le monde industriel et son fonctionnement. "
                          "Aussi bien sur le plan structurel que sur le plan organisationnel, tout en étant impliqué dans la vie de l'entreprise. "
                          "\n\n"
                          "C'est ma toute première expérience en entreprise en tant que stagiaire ouvrier dans une si grande entreprise industrielle. J'y ai découvert le fonctionnement d'une Plateforme Industrielle Courrier.\n\n"
                          "Pendant mon stage au sein de la PIC, j’avais deux missions principales :\n\n"
                          "1) Trier du courrier sur Machines :\n"
                          "   - Préparation et rangement du chantier\n"
                          "   - Dépilage sur machine de tri grands formats\n"
                          "   - Alimentation de machines grands formats\n\n"

                          "2) Gérer l’activité du Brin de rejets :\n"
                          "   - Organisation de l’activité du brin de rejet\n"
                          "   -  Rangement des caissettes selon leurs destinations\n"
                          "   - Rangement des CE30 selon leurs destinations\n\n"

                          "Mes horaires de service étaient de 6H00 à 13H00 du Lundi au samedi inclus (avec un repos hebdomadaire le mardi).",
                      style: TextStyle(color: Colors.black45))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Apropos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("A propos de cette application"),),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    height: 130.0,
                    decoration: BoxDecoration(color: Colors.blue),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/images/home.jpg"),
                          fit: BoxFit.cover
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 400.0,
            padding: const EdgeInsets.only(top: 40.0),

            decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(70)
            ),

            child: Column(
              children: <Widget>[
                Text("A propos de l'application", style: TextStyle(color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Center(child: Text(
                      "Je suis tombé sur un article qui traitait d'un sujet piquant du monde de la programmation : la sortie de Flutter."
                          "\n"
                          "Flutter est un Framework (environnement de travail) créé par Google qui permet de réaliser des applications webs et surtout mobiles qui fonctionnent sur "
                          "Android et sur Ios. Et c'est là tout son succès, car utilisant un langage simple (le Dart) pour obtenir une aapplication CrossPlateforme."
                          "\n\n"
                          "Bref, sinon je ne vais plus m'arrêter !! En fait, tout est parti de la curiosité de découvrir ce nouvel outil de développement dont le succès "
                          "fait beaucoup de bruit. Étant en stage en ce moment, j'ai donc pensé à apprendre ce langage par la pratique : réaliser une application "
                          "dans le cadre de mon stage. Ma motivation actuelle est donc d'apprendre les bases de ce langage tout en inmmortalisant cette période de stage.",
                      style: TextStyle(color: Colors.black45))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


