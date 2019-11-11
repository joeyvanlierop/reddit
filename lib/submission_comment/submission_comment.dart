import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/components/submission_comment_header.dart';
import 'package:reddit/submission_comment_tree/submission_comment_tree.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: InkWell(
            onTap: () {
              setState(() {
                return this.expanded = !this.expanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubmissionCommentHeader(comment: widget.comment),
            ),
          ),
        ),
        if (widget.replies != null)
          AnimatedContainer(
            height: expanded ? 100 : 10,
            duration: Duration(milliseconds: 400),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: SubmissionCommentTree(comments: widget.replies),
            ),
          ),
      ],
    );
  }
}
