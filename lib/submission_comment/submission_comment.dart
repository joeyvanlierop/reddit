import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/components/submission_comment_body.dart';
import 'package:reddit/submission_comment/components/submission_comment_header.dart';

List<Color> depthColor = [
  Colors.transparent,
  Colors.deepPurple,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.green.shade600,
  Colors.amber,
  Colors.orange,
  Colors.red,
];

class SubmissionComment extends StatefulWidget {
  final Comment comment;
  final CommentForest replies;

  const SubmissionComment({
    Key key,
    @required this.comment,
    this.replies,
  }) : super(key: key);

  @override
  _SubmissionCommentState createState() => _SubmissionCommentState();
}

class _SubmissionCommentState extends State<SubmissionComment> {
  bool expanded;

  @override
  void initState() {
    super.initState();

    this.expanded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
              width: 4.0,
              color: depthColor[widget.comment.depth % depthColor.length]),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SubmissionCommentHeader(comment: widget.comment),
            SizedBox(
              height: 8.0,
            ),
            SubmissionCommentBody(comment: widget.comment),
          ],
        ),
      ),
    );
  }
}
