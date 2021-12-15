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
      return Image.asset('assets/img/nutriscoreA.png');
    }
    if (nutriscore == "b") {
      return Image.asset('assets/img/nutriscoreB.png');
    }
    if (nutriscore == "c") {
      return Image.asset('assets/img/nutriscoreC.png');
    }
    if (nutriscore == "d") {
      return Image.asset('assets/img/nutriscoreD.png');
    }
    if (nutriscore == "e") {
      return Image.asset('assets/img/nutriscoreE.png');
    }
    return Image.asset('assets/img/nutriscoreE.png');
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow({Key? key, required this.ingredient}) : super(key: key);

  final Ingredients ingredient;

  @override
  Widget build(BuildContext context) {
    final elements = <Widget>[];
    if (ingredient.id != null) {
      elements.add(Text(ingredient.id.toString()));
    }
    if (ingredient.percent != null) {
      elements.add(Text(ingredient.percent.toString()));
    }
    if (ingredient.text != null) {
      elements.add(Text(ingredient.text.toString()));
    }
    if (ingredient.vegan != null) {
      elements.add(Text(ingredient.vegan.toString()));
    }
    if (ingredient.vegetarian != null) {
      elements.add(Text(ingredient.vegetarian.toString()));
    }
    return Row(
      children: elements,
    );
  }
}
