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
  List<Comment> commentList;

  @override
  void initState() {
    super.initState();

    commentList = _buildCommentTree();
  }

  List<Comment> _buildCommentTree({CommentForest commentForest}) {
    List<Comment> comments = [];
    commentForest ??= widget.commentForest;

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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SubmissionComment(
            comment: commentList[index],
          );
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
