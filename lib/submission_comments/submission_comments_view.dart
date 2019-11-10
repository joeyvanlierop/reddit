import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comments/submission_comment_tree.dart';

class SubmissionCommentsView extends StatelessWidget {
  final Submission submission;

  const SubmissionCommentsView({
    Key key,
    @required this.submission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CommentForest>(
      future: _getComments(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return SubmissionCommentTree(comments: snapshot.data);
          default:
            return LoadingIndicator();
        }
      },
    );
  }

  Future<CommentForest> _getComments() async {
    return await this.submission.refreshComments();
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}
