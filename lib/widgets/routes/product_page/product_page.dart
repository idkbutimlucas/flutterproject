import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iut2021/models/ingredients.dart';
import 'package:iut2021/models/products.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Products;
    return Scaffold(
      appBar: AppBar(
        // titre de la page
        title: const Text(
          'Resultats',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Image.network(
            args.imageUrl!,
            width: 200,
            height: 200,
          ),
          Text(args.name!.toString()),
          Expanded(
            child: ListView.builder(
              itemCount: args.ingredients!.length,
              itemBuilder: (context, position) {
                return IngredientRow(ingredient: args.ingredients![position]);
              },
            ),
          ),
          Nutriscore(nutriscore: args.nutriscore!),
        ]),
      ),
    );
  }
}

class Nutriscore extends StatelessWidget {
  const Nutriscore({Key? key, required this.nutriscore}) : super(key: key);

  final String nutriscore;

  @override
  Widget build(BuildContext context) {
    if (nutriscore == "a") {
      return Image.asset(
        'assets/img/nutriscoreA.png',
        height: 150,
        width: 150,
      );
    }
    if (nutriscore == "b") {
      return Image.asset(
        'assets/img/nutriscoreB.png',
        height: 150,
        width: 150,
      );
    }
    if (nutriscore == "c") {
      return Image.asset(
        'assets/img/nutriscoreC.png',
        height: 150,
        width: 150,
      );
    }
    if (nutriscore == "d") {
      return Image.asset(
        'assets/img/nutriscoreD.png',
        height: 150,
        width: 150,
      );
    }
    if (nutriscore == "e") {
      return Image.asset(
        'assets/img/nutriscoreE.png',
        height: 150,
        width: 150,
      );
    }
    return Image.asset(
      'assets/img/nutriscoreE.png',
      height: 150,
      width: 150,
    );
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow({Key? key, required this.ingredient}) : super(key: key);

  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
    final elements = <Widget>[];
    if (ingredient.text != null) {
      elements.add(Text("Ingrédient: " + ingredient.text.toString()));
    }
    if (ingredient.percent != null) {
      elements.add(
          Text("Empreinte carbone: " + ingredient.percent.toString() + "%"));
    }
    if (ingredient.vegan != null) {
      elements.add(Row(children: const [
        Text("Ingrédient vegan"),
        Icon(Icons.nature, color: Colors.green)
      ]));
    }
    if (ingredient.vegetarian != null) {
      elements.add(Row(children: const [
        Text("Ingrédient végétarien", textAlign: TextAlign.center),
        Icon(Icons.emoji_nature, color: Colors.green),
      ]));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: elements,
        ),
      ),
    );
  }
}
