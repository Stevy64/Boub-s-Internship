import 'package:flutter/material.dart';
import 'package:stagiaire/Messagerie/src/login.dart';


void main() => runApp(Messagerie());

class Messagerie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messagerie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.grey.shade300
      ),
      home: Login(),
    );
  }
}