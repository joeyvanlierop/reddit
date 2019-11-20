import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment/submission_comment.dart';

class SubmissionCommentTree extends StatefulWidget {
  final CommentForest commentForest;

  const SubmissionCommentTree({
    Key key,
    @required this.commentForest,
  }) : super(key: key);

  @override
  _SubmissionCommentTreeState createState() => _SubmissionCommentTreeState();
}

class _SubmissionCommentTreeState extends State<SubmissionCommentTree> {
  List<SubmissionComment> commentList;

  @override
  void initState() {
    super.initState();

    commentList = _buildCommentTree();
  }

  List<SubmissionComment> _buildCommentTree({CommentForest commentForest}) {
    List<SubmissionComment> comments = [];
    commentForest ??= widget.commentForest;

    commentForest.comments.forEach((comment) {
      if (comment is Comment) {
        comments.add(SubmissionComment(
          comment: comment,
        ));

        if (comment.replies != null) {
          comments.addAll(_buildCommentTree(commentForest: comment.replies));
        }
      }
    });

    return comments;
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return commentList[index];
        },
        childCount: commentList.length,
      ),
    );
//    return ListView.builder(
//      physics: NeverScrollableScrollPhysics(),
//      primary: false,
//      shrinkWrap: true,
//      itemCount: commentTree.length,
//      itemBuilder: (context, index) {
//        return SubmissionComment(comment: commentTree[index]);
//      },
//    );
  }
}
