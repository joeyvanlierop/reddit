import 'package:flutter/material.dart';

import 'posts/post.dart';
import 'themes/theme.dart';

void main() => runApp(MyApp());

List posts = [
  "images/thumb0.jpg",
  "images/thumb1.jpg",
  "images/thumb2.jpg",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
