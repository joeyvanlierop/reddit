import 'package:flutter/material.dart';
import 'package:reddit/themes/theme.dart';

import 'posts/post.dart';

void main() => runApp(MyApp());

List posts = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Reddit",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: PostList(
          posts: posts,
        ),
      ),
    );
  }
}
