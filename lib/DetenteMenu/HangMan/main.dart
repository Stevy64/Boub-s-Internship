import 'package:flutter/material.dart';

import 'package:stagiaire/DetenteMenu/HangMan/engine/hangman.dart';
import 'package:stagiaire/DetenteMenu/HangMan/ui/hangman_page.dart';

const List<String> wordList = const ["BRIN DE REJET","DEPIOTE","TRI","MANUEL","STAGIAIRE","REFERENTS","DIEDRES","PLATEFORME INDUSTRIELLE","COURIERS","LA POSTE","LA PRESSE","RAOUF","SECURITE","DISTRIBUTION","PAUSE","LOGISTIQUE","TRI","FORMAT","DEPILER","CAISSETTES","BACS","CHARIOTS","QUANTIEME","ENHANCE","PILL","OPPOSED","FLAG","RACE","SPEED","MTIPF","MTIGF","KUBES"];

//void main() => runApp(HangmanPostier());

void main() {
  runApp(HangmanPostier());
}

class HangmanPostier extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HangmanPostier();
}

class _HangmanPostier extends State<HangmanPostier> {
  HangmanGame _engine;

  @override
  void initState() {
    super.initState();

    _engine = HangmanGame(wordList);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Pendu Postal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HangmanPage(_engine),
    );
  }
}
