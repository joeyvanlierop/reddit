import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Reddit"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PostContent(),
                PostDivider(),
                PostContent(),
                PostDivider(),
                PostContent(),
                PostDivider(),
                PostContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PostContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: new BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class PostDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
    );
  }
}
