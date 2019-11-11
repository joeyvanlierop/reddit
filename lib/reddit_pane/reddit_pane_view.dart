import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_comment_tree/submission_comments_view.dart';
import 'package:reddit/submission_list/submission_list.dart';
import 'package:reddit/submission_listing/layouts/submission_listing_header.dart';

import 'bloc/bloc.dart';

class RedditPane extends StatelessWidget {
  static PageController pageController = new PageController();

  final String subreddit;
  final int limit;

  const RedditPane({
    Key key,
    @required this.subreddit,
    this.limit = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedditPaneBloc, RedditPaneState>(
      builder: (context, state) {
        return PageView(
          controller: pageController,
          children: <Widget>[
            SubmissionList(
              subreddit: this.subreddit,
              limit: this.limit,
            ),
            Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      SubmissionListingHeader(
                        submission: state.submission,
                      ),
                      SubmissionCommentsView(
                        submission: state.submission,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
