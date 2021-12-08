import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Post {
  final String? title;
  final String? description;

  Post(this.title, this.description);
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<List<Post>> search(String? search) async {
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 1));
    return List.generate(search!.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title.toString()),
                subtitle: Text(post.description.toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
