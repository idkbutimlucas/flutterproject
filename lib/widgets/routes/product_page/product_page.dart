import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                return Row(
                  children: <Widget>[
                    Text(args.ingredients![position].id!),
                    Text(args.ingredients![position].text!),
                    Text(args.ingredients![position].percent!.toString()),
                    Text(args.ingredients![position].vegan!),
                    Text(args.ingredients![position].vegetarian!),
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
