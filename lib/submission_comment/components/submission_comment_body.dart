import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class SubmissionCommentBody extends StatelessWidget {
  final Comment comment;

  const SubmissionCommentBody({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MarkdownBody(
        data: comment.body,
        onTapLink: (link) => print(link),
//        style:
//            Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),
      ),
    );
  }
}
