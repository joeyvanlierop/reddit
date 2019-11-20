import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_comment_tree/submission_comments_screen.dart';
import 'package:reddit/submission_list/submission_list_screen.dart';

import 'bloc/bloc.dart';

class RedditPane extends StatelessWidget {
  static PageController pageController = PageController();

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
            SubmissionListScreen(
              subreddit: subreddit,
              limit: limit,
            ),
            SubmissionCommentsScreen(
              submission: state.submission,
            ),
          ],
        );
      },
    );
  }
}
