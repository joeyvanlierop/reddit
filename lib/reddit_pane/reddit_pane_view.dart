import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_comment_tree/submission_comments_page.dart';
import 'package:reddit/submission_list/submission_list_page.dart';

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
          physics: AlwaysScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            SubmissionListPage(
              subreddit: this.subreddit,
              limit: this.limit,
            ),
            SubmissionCommentsPage(
              submission: state.submission,
            ),
          ],
        );
      },
    );
  }
}
