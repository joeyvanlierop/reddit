import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comments/submission_comment.dart';
import 'package:reddit/submission_listing/submission_listing.dart';
import 'package:reddit/submission_listing/submission_seperator.dart';

class SubmissionCommentTree extends StatelessWidget {
  final CommentForest comments;

  const SubmissionCommentTree({
    Key key,
    @required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: this.comments.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SubmissionComment(comment: this.comments[index]),
        );
      },
      separatorBuilder: (context, index) {
        return SubmissionSeperator(
          submissionListingLayout: SubmissionListingLayout.compact,
        );
      },
    );
  }
}
