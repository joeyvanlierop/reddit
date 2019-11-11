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
  List<Comment> commentList;

  @override
  void initState() {
    super.initState();

    commentList = _getComments();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.comments.length,
      itemBuilder: (context, index) {
        Comment comment = commentList[index];
        print(comment.depth);

        return Padding(
          padding: EdgeInsets.only(left: 4.0 * comment.depth),
          child: InkWell(
            onTap: () {},
            child: SubmissionComment(comment: comment),
          ),
        );
      },
    );
  }

  List<Comment> _getComments() {
    List<Comment> commentList = [];

    widget.comments.comments.forEach((comment) {
      if (comment is Comment) {
        commentList.add(comment);

        if (comment.replies != null) {
          commentList.addAll(_getReplies(comment));
        }
      }
    });

    return commentList;
  }

  List<Comment> _getReplies(Comment parent) {
    List<Comment> replyList = [];

    parent.replies.comments.forEach((reply) {
      if (reply is Comment) {
        replyList.add(reply);

        if (reply.replies != null) {
          replyList.addAll(_getReplies(reply));
        }
      }
    });

    return replyList;
  }
}
