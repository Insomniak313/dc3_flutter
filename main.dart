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
        child: TestWithState(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  // private
  final String _title;

  const Test({Key key, @required String title})
      : _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(_title),
          ],
        ));
  }
}

class TestWithState extends StatefulWidget {
  @override
  _TestWithStateState createState() => _TestWithStateState();
}

class _TestWithStateState extends State<TestWithState> {
  int _compteur;

  @override
  void initState() {
    super.initState();
    setState(() {
      _compteur = 0;
    });
  }

  void incrementerCompteur() {
    setState(() {
      _compteur = _compteur + 1;
    });
  }

  int renvoyerNombre() {
    return 2;
  }

  int renvoyerNombreBis() => 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 40),
            child: Text(
          'Widget with state : ' + _compteur.toString(),
          style: TextStyle(fontSize: 18),
        )),
        Text('!'),
        InkWell(
          onTap: () => incrementerCompteur(),
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(color: Colors.red),
            child: Text('Cliquez moi'),
          ),
        )
      ],
    );
  }
}
