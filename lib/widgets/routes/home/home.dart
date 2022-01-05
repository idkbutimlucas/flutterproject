import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/providers/state_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nutriscore = "a";
  String additif = "indiférent";
  String palme = "indiférent";

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Food Search"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Recherchez",
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2, fontSize: 25),
                ),
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    labelText: 'Nom du Produit',
                    hintText: 'Entrez le nom du Produit',
                    icon: Icon(Icons.no_food),
                  ),
                  keyboardType: TextInputType.text,
                ),
                Card(
                    child: Column(
                  children: [
                    const Text(
                      'Nutri-Score',
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 2, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "a",
                          groupValue: nutriscore,
                          onChanged: nutriscoreMethod,
                          activeColor: Colors.green[200],
                        ),
                        const Text("A"),
                        Radio(
                          value: "b",
                          groupValue: nutriscore,
                          onChanged: nutriscoreMethod,
                          activeColor: Colors.green[100],
                        ),
                        const Text("B"),
                        Radio(
                          value: "c",
                          groupValue: nutriscore,
                          onChanged: nutriscoreMethod,
                          activeColor: Colors.yellow,
                        ),
                        const Text("C"),
                        Radio(
                          value: "d",
                          groupValue: nutriscore,
                          onChanged: nutriscoreMethod,
                          activeColor: Colors.orange,
                        ),
                        const Text("D"),
                        Radio(
                          value: "e",
                          groupValue: nutriscore,
                          onChanged: nutriscoreMethod,
                          activeColor: Colors.red,
                        ),
                        const Text("E"),
                      ],
                    )
                  ],
                )),
                // const TextField(
                //   decoration: InputDecoration(
                //     labelText: 'Nutri-Score',
                //     hintText: 'Entrez la lettre du nutri-score',
                //     icon: Icon(Icons.leaderboard),
                //   ),
                //   keyboardType: TextInputType.text,
                // ),
                const Text(
                  "Ingrédients",
                  textAlign: TextAlign.left,
                  style: TextStyle(height: 3, fontSize: 20),
                ),
                Card(
                    child: Column(
                  children: [
                    const Text(
                      'Aditiffs',
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 2, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "sans",
                          groupValue: additif,
                          onChanged: additifMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Sans"),
                        Radio(
                          value: "avec",
                          groupValue: additif,
                          onChanged: additifMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Avec"),
                        Radio(
                          value: "indiférent",
                          groupValue: additif,
                          onChanged: additifMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Indiférent"),
                      ],
                    )
                  ],
                )),
                Card(
                    child: Column(
                  children: [
                    const Text(
                      'Huile de palme',
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 2, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: "sans",
                          groupValue: palme,
                          onChanged: palmeMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Sans"),
                        Radio(
                          value: "avec",
                          groupValue: palme,
                          onChanged: palmeMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Avec"),
                        Radio(
                          value: "indiférent",
                          groupValue: palme,
                          onChanged: palmeMethod,
                          activeColor: Colors.blue,
                        ),
                        const Text("Indiférent"),
                      ],
                    )
                  ],
                )),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                        onPressed: () {
                          //if (_dropdownFormKey.currentState.validate()) {
                          ref.read(searchStateProvider.notifier).changeSearch(
                              myController.text, nutriscore, additif, palme);

                          Navigator.pushNamed(context, '/listproduct');
                          //}
                        },
                        child: const Text(
                          "Recherchez",
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1, fontSize: 20),
                        ));
                  },
                )
              ]),
        ));
  }

  void nutriscoreMethod(value) {
    setState(() {
      nutriscore = value as String;
    });
  }

  void additifMethod(value) {
    setState(() {
      additif = value as String;
    });
  }

  void palmeMethod(value) {
    setState(() {
      palme = value as String;
    });
  }
}

/*// ignore: camel_case_types
class _dropdownFormKey {
  // ignore: prefer_typing_uninitialized_variables
  static var currentState;
}*/
