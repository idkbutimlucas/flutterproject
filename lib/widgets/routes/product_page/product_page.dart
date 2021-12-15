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
          Text("ggg" + args.ingredients![0].id!),
          Expanded(
            child: ListView.builder(
              itemCount: args.ingredients!.length,
              itemBuilder: (context, position) {
                return IngredientRow(ingredient: args.ingredients![position]);
              },
            ),
          )
        ]),
      ),
    );
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
    if (ingredient.id != null) {
      elements.add(Text(ingredient.percent.toString()));
    }
    if (ingredient.id != null) {
      elements.add(Text(ingredient.text.toString()));
    }
    if (ingredient.id != null) {
      elements.add(Text(ingredient.vegan.toString()));
    }
    if (ingredient.id != null) {
      elements.add(Text(ingredient.vegetarian.toString()));
    }
    return Row(
      children: elements,
    );
  }
}
