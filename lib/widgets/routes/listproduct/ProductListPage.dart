import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/models/products.dart';

import '../../../providers/test_dio.provider.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(


  //----------------------------------------------------------------------
      // la APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,

        // titre de la page 
        title: const Text('Resultats',
         style: TextStyle(color: Colors.black,
          fontFamily: 'FiraSans',
          fontWeight: FontWeight.bold,
          fontSize: 32, 
         ),textAlign: TextAlign.center,
        ),

        // Incos de Retour
        leading: const IconButton(alignment: Alignment.centerRight,
           icon: Icon(Icons.arrow_back_ios),
           tooltip: 'Retour',
           onPressed: null, color: Colors.black
        ),
      ), 

  // ---------------------------------------------------------------------
      // Le corps de l'appli
         body: ref
          .watch(testDioProvider)
          .map(data: _onData, error: _onError, loading: _onLoading),
    );
  }

  Widget _onError(error) {
    return Container(
      color: Colors.red,
    );
  }

  Widget _onLoading(loading) {
    return Container(
      color: Colors.purple,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }



  // ------------------------------------------------------------------------
  // La liste des ingrédients 
  Widget _onData(data) {
    Food f = data.value;
    return ListView.builder(
      itemCount: f.products!.length,
      itemBuilder: (context, position) {
        return GestureDetector(
          onTap: () {
            Products p = f.products![position];
            Navigator.pushNamed(context, '/product_page', arguments: p);
          },

          child: Container(
            width: 100,
            height: 250,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 232, 232),
              borderRadius: BorderRadius.circular(10)),
              

          //-------------------------------------
          // Affichage pour un produit
            
              child: Row(
                children: [Column(children: [Text(

                  f.products![position].name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 40, 39, 39),
                  fontFamily: 'FiraSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)
                  ),

                  Image.network(
                    f.products![position].imageUrl!,
                    width: 100,
                    height: 150,
                    alignment: Alignment.bottomCenter,
                  ),
                ]  
                ),]
              
          ),
        ),
        );
        
      },
    );
  }
}


