import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iut2021/providers/searchDio.provider.dart';
import 'package:iut2021/widgets/routes/home/home.dart';
import 'package:iut2021/widgets/routes/productListPage/productListPage.dart';
import 'package:iut2021/widgets/routes/productPage/productPage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Palette.white,
      ),
      home: const ProviderScope(
        child: Home(),
      ),
      routes: {
        '/product_page': (context) => const ProductPage(),
        '/listproduct': (context) => const ProductListPage()
      },
    );
  }
}

// ---------------------------------------------------------------------------------
// Classe de la couleur de l'AppBar
class Palette {
  static const MaterialColor white = MaterialColor(0xFFFFFFFF, <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  });
}

// -----------------------------------------------------------------------------------

class Dio extends ConsumerWidget {
  const Dio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(searchDioProvider)
        .map(data: _onData, error: _onError, loading: _onLoading);
  }

  Widget _onError(error) {
    return Container(
      color: Colors.red,
    );
  }

  Widget _onLoading(loading) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _onData(data) {
    return Container(
      color: Colors.green,
    );
  }
}
