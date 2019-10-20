import 'package:flutter/material.dart';
import 'package:reddit/posts/post_text.dart';
import 'package:reddit/posts/post_thumbnail.dart';

class Post extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;

  const Post({
    Key key,
    this.imagePath,
    @required this.title,
    @required this.subreddit,
    @required this.upvotes,
    @required this.comments,
    @required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
            PostImage(
              this.imagePath,
            ),
          ],
        ),
      ),
    );
  }
}

class PostDivider extends StatelessWidget {
  final Color color;
  final double thickness;

  const PostDivider({
    Key key,
    this.color,
    this.thickness,
  })  : assert(thickness >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: this.color ?? Theme.of(context).dividerColor,
                width: this.thickness ?? Theme.of(context).dividerColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({Key key, this.posts}) : super(key: key);

  final List posts;

  @override
  Widget build(BuildContext context) {
    // TODO: AnimatedList
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Post(
          imagePath: posts[index],
          title:
              "This is the best photo I have ever taken... it's all downhere from here folks!",
          subreddit: "Aww",
          upvotes: 12016,
          comments: 101,
          age: 2,
        );
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: PostDivider(
            thickness: 1.0,
          ),
        );
      },
    );
  }
}
