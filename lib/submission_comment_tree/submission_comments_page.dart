import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_comment_tree/submission_comment_tree.dart';
import 'package:reddit/submission_listing/layouts/submission_listing_header.dart';

class SubmissionCommentsPage extends StatelessWidget {
  final Submission submission;

  const SubmissionCommentsPage({
    Key key,
    @required this.submission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          //Change to appbar style something
          SliverSafeArea(
            sliver: SliverToBoxAdapter(
              child: SubmissionListingHeader(
                submission: this.submission,
              ),
            ),
          ),
          FutureBuilder<CommentForest>(
            future: _fetchComments(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return SubmissionCommentTree(commentForest: snapshot.data);
                default:
                  return SliverToBoxAdapter(
                    child: LoadingIndicator(),
                  );
              }
            },
          ),
        ],
      ),
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              SubmissionListingHeader(
//                submission: this.submission,
//              ),
//              FutureBuilder<CommentForest>(
//                future: _fetchComments(),
//                builder: (context, snapshot) {
//                  switch (snapshot.connectionState) {
//                    case ConnectionState.done:
//                      return SubmissionCommentTree(
//                          topLevelComments: snapshot.data);
//                    default:
//                      return LoadingIndicator();
//                  }
//                },
//              ),
//            ],
//          ),
    );
  }

  Future<CommentForest> _fetchComments() async {
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
