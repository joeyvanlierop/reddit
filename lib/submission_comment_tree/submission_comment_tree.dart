import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/submission_comment.dart';

class SubmissionCommentTree extends StatefulWidget {
  final CommentForest comments;

  const SubmissionCommentTree({
    Key key,
    @required this.comments,
  }) : super(key: key);

  @override
  _SubmissionCommentTreeState createState() => _SubmissionCommentTreeState();
}

class _SubmissionCommentTreeState extends State<SubmissionCommentTree> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: widget.comments.length,
      itemBuilder: (context, index) {
        if (widget.comments[index] is! Comment) {
          return null;
        }

        return SubmissionComment(comment: widget.comments[index]);
      },
    );
  }
}
