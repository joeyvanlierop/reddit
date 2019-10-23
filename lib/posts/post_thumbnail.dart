import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reddit/posts/post_data.dart';

class PostImage extends StatelessWidget {
  final PostData postData;

  const PostImage({
    Key key,
    this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      clipBehavior: Clip.hardEdge,
      child: Ink.image(
        image: NetworkImage(this.postData.thumbnail),
        fit: BoxFit.cover,
        width: 70.0,
        height: 70.0,
        child: InkWell(
          onTap: () {
            print('Thumbnail');
          },
        ),
      ),
    );
  }
}
