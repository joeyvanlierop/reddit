import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/components/submission_comment_body.dart';
import 'package:reddit/submission_comment/components/submission_comment_header.dart';

class SubmissionComment extends StatefulWidget {
  static final List<Color> depthColor = [
    Colors.transparent,
    Colors.deepPurple,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.green.shade600,
    Colors.amber,
    Colors.orange,
    Colors.red,
  ];
  static final double depthMargin = 4.0;
  final Comment comment;

  const SubmissionComment({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  _SubmissionCommentState createState() => _SubmissionCommentState();
}

class _SubmissionCommentState extends State<SubmissionComment> {
  bool expanded;
  int depth;

  @override
  void initState() {
    super.initState();

    this.expanded = true;
    this.depth = widget.comment.depth;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: SubmissionComment.depthMargin * depth),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: 4.0,
              color: SubmissionComment
                  .depthColor[depth % SubmissionComment.depthColor.length],
            ),
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
      ),
    );
  }
}
