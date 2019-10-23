import 'package:flutter/material.dart';
import 'package:reddit/posts/post_data.dart';
import 'package:reddit/posts/post_text.dart';
import 'package:reddit/posts/post_thumbnail.dart';

class Post extends StatelessWidget {
  final PostData postData;

  const Post({
    Key key,
    @required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Post");
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: PostText(
                postData: this.postData,
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            PostImage(
              postData: this.postData,
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
          postData: posts[index],
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
