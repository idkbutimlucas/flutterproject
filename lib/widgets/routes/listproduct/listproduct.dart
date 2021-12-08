import 'package:flutter/material.dart';
import 'package:iut2021/widgets/routes/animation/delayed_animation.dart';



// classe de la page de la liste des produits ( le body de la page )
class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchSection(),
            ProductView()
            ]
        ,),
      ),
    );
  }
}



// classe de la section de l'affichage de recherche de la page 
class SearchSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: DelayedAnimation(delay: 1000,
      child: FlutterLogo(size: 200,),
      ),
    );
  }
}


// classe de la section de l'affichage des produits sur la page 
class ProductView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      color: Colors.black12,
    );
  }
}