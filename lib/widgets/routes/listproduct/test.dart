import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/models/food.dart';
import 'package:iut2021/models/products.dart';

import '../../../providers/test_dio.provider.dart';

class Test extends ConsumerWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
          child: Row(
            children: [
              Text(f.products![position].name!),
              Image.network(
                f.products![position].imageUrl!,
                width: 200,
                height: 200,
              )
            ],
          ),
        );
      },
    );
  }
}
