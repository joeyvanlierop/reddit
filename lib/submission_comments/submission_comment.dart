import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comments/submission_comment_tree.dart';

class SubmissionComment extends StatelessWidget {
  final Comment comment;

  const SubmissionComment({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentForest replies = this.comment.replies;

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(comment.body),
          if (replies != null) SubmissionCommentTree(comments: replies),
        ],
      ),
    );
  }
}
