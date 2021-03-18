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
  bool _doitDessinerUneCroix;

  bool _joueurCroixGagne;
  bool _joueurRondGagne;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiserGrille();
  }

  @override
  Widget build(BuildContext context) {
    String message = '';
    if (_joueurCroixGagne) {
      message = 'Joueur CROIX Gagne !';
    }

    if (_joueurRondGagne) {
      message = 'Joueur ROND Gagne !';
    }

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.pinkAccent),
            height: 50,
            child: Text(message),
          ),
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
      _doitDessinerUneCroix = true;
      _joueurCroixGagne = false;
      _joueurRondGagne = false;
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

  bool verifierSiJoueurGagne(String caractereAVerifier) {
    bool aGagne = false;
    int cpt = 0;

    _grille.forEach((ligne) {
      cpt = 0;
      ligne.forEach((cellule) {
        if (cellule == caractereAVerifier) {
          cpt = cpt + 1;
        }
      });
      if (cpt == 3) {
        aGagne = true;
      }
    });

    for (int numeroColonne = 0; numeroColonne < 2; numeroColonne++) {
      if (_grille[0][numeroColonne] == caractereAVerifier &&
          _grille[1][numeroColonne] == caractereAVerifier &&
          _grille[2][numeroColonne] == caractereAVerifier) {
        aGagne = true;
      }
    }

    if (_grille[2][0] == caractereAVerifier &&
        _grille[1][1] == caractereAVerifier &&
        _grille[0][2] == caractereAVerifier) {
      aGagne = true;
    }

    if (_grille[0][0] == caractereAVerifier &&
        _grille[1][1] == caractereAVerifier &&
        _grille[2][2] == caractereAVerifier) {
      aGagne = true;
    }

    return aGagne;
  }

  Widget construireCellule(int ligne, int colonne) {
    return InkWell(
      onTap: () {
        setState(() {
          if(_joueurRondGagne == false && _joueurCroixGagne == false && _grille[ligne][colonne] == '') {
            _grille[ligne][colonne] = _doitDessinerUneCroix ? 'x' : 'o';
            _doitDessinerUneCroix = !_doitDessinerUneCroix;

            _joueurCroixGagne = verifierSiJoueurGagne('x');
            _joueurRondGagne = verifierSiJoueurGagne('o');
          }

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
