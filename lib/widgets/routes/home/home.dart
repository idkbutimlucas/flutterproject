import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Search"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Recherchez",
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2, fontSize: 25),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom du Produit',
                    hintText: 'Entrez le nom du Produit',
                    icon: Icon(Icons.no_food),
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nutri-Score',
                    hintText: 'Entrez la lettre du nutri-score',
                    icon: Icon(Icons.leaderboard),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Text(
                  "Ingrédients",
                  textAlign: TextAlign.left,
                  style: TextStyle(height: 3, fontSize: 20),
                ),
              ]),
        ));
  }
}
