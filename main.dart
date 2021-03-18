import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Morpion()],
        ),
      ),
    );
  }
}

class Morpion extends StatefulWidget {
  @override
  _MorpionState createState() => _MorpionState();
}

class _MorpionState extends State<Morpion> {
  List _grille;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiserGrille();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              construireColonne(0),
              construireColonne(1),
              construireColonne(2),
            ],
          ),
          InkWell(
            onTap: () {
              initialiserGrille();
            },
            child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(color: Colors.yellow),
                child: Center(
                    child: Text(
                  'Réinitialiser',
                  style: TextStyle(fontSize: 18),
                ))),
          )
        ],
      ),
    );
  }

  void initialiserGrille() {
    setState(() {
      _grille = [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ];
    });
  }

  Widget construireColonne(int colonne) {
    return Column(
      children: <Widget>[
        construireCellule(0, colonne),
        construireCellule(1, colonne),
        construireCellule(2, colonne),
      ],
    );
  }

  Widget construireCellule(int ligne, int colonne) {
    return InkWell(
      onTap: () {
        setState(() {
          _grille[ligne][colonne] = 'x';
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.grey),
        margin: EdgeInsets.only(bottom: 5, right: 5),
        child: Center(
            child: Text(
          _grille[ligne][colonne],
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        )),
      ),
    );
  }
}
