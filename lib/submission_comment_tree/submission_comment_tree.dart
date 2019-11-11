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
  bool expanded;

  @override
  void initState() {
    super.initState();

    expanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.comments.length,
        itemBuilder: (context, index) {
          if (!(widget.comments[index] is Comment)) {
            return null;
          }

          Comment comment = widget.comments[index];
          CommentForest replies = comment.replies;

          return SubmissionComment(
            comment: comment,
            replies: replies,
          );
        },
      ),
    );
  }
}
