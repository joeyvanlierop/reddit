import 'package:flutter/material.dart';

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
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Reddit"),
        ),
        body: PostList(),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Post(
          imagePath: posts[index],
          title:
              "This is the title of a post. This title is great and it is so cool wow.",
          subreddit: "GlobalOffensive",
          upvotes: 12,
          comments: 101,
          age: 2,
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PostDivider(
            color: Colors.grey.shade200,
            thickness: 1.0,
          ),
        );
      },
    );
  }
}

class Post extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;

  Post({
    this.imagePath,
    @required this.title,
    @required this.subreddit,
    @required this.upvotes,
    @required this.comments,
    @required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: PostContent(
                title: this.title,
                subreddit: this.subreddit,
                upvotes: this.upvotes,
                comments: this.comments,
                age: this.age,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            PostImage(this.imagePath),
          ],
        ),
      ),
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({
    Key key,
    this.title,
    this.subreddit,
    this.upvotes,
    this.comments,
    this.age,
  }) : super(key: key);

  final String title;
  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        children: <Widget>[
          PostContentTitle(
            title: this.title,
          ),
          SizedBox(
            height: 4.0,
          ),
          PostContentMeta(
            subreddit: this.subreddit,
            upvotes: this.upvotes,
            comments: this.comments,
            age: this.age,
          ),
        ],
      ),
    );
  }
}

class PostContentTitle extends StatelessWidget {
  const PostContentTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class PostContentMeta extends StatelessWidget {
  const PostContentMeta({
    Key key,
    @required this.subreddit,
    @required this.upvotes,
    @required this.comments,
    @required this.age,
    this.textStyle,
  }) : super(key: key);

  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(this.subreddit),
        Row(
          children: <Widget>[
            Text(this.upvotes.toString()),
            Text(this.comments.toString()),
            Text(this.age.toString()),
          ],
        ),
      ],
    );
  }
}

class PostImage extends StatelessWidget {
  final String imagePath;

  const PostImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("TEST"),
      child: Ink.image(
        height: 70,
        width: 70,
        fit: BoxFit.cover,
        image: AssetImage(this.imagePath),
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
  }
}

class PostDivider extends StatelessWidget {
  final Color color;
  final double thickness;

  const PostDivider({Key key, this.color, this.thickness})
      : assert(thickness >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: this.color,
                width: this.thickness,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
