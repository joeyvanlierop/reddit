import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/submission_comment.dart';

class SubmissionCommentTree extends StatefulWidget {
  final CommentForest topLevelComments;

  const SubmissionCommentTree({
    Key key,
    @required this.topLevelComments,
  }) : super(key: key);

  @override
  _SubmissionCommentTreeState createState() => _SubmissionCommentTreeState();
}

class _SubmissionCommentTreeState extends State<SubmissionCommentTree> {
  List<Comment> commentTree;

  @override
  void initState() {
    super.initState();

    commentTree = _buildCommentTree();
  }

  List<Comment> _buildCommentTree({CommentForest commentForest}) {
    List<Comment> comments = [];
    commentForest ??= widget.topLevelComments;

    commentForest.comments.forEach((comment) {
      if (comment is Comment) {
        comments.add(comment);

        if (comment.replies != null) {
          comments.addAll(_buildCommentTree(commentForest: comment.replies));
        }
      }
    });

    return comments;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      shrinkWrap: true,
      itemCount: commentTree.length,
      itemBuilder: (context, index) {
        return SubmissionComment(comment: commentTree[index]);
      },
    );
  }
}
