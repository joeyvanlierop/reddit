import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

class SubmissionCommentBody extends StatelessWidget {
  final Comment comment;

  const SubmissionCommentBody({
    Key key,
    @required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        comment.body,
        style:
            Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),
      ),
    );
  }
}
