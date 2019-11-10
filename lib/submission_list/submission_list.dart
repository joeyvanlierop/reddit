import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/app_theme/bloc/bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/submission_list/submission_list_view.dart';

import 'bloc/bloc.dart';

class SubmissionList extends StatefulWidget {
  final String subreddit;
  final int limit;

  const SubmissionList({
    Key key,
    @required this.subreddit,
    this.limit = 25,
  }) : super(key: key);

  @override
  _SubmissionListState createState() => _SubmissionListState();
}

class _SubmissionListState extends State<SubmissionList>
    with AutomaticKeepAliveClientMixin<SubmissionList> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onDoubleTap: () => BlocProvider.of<RedditPaneBloc>(context)
              .add(SwapRedditPaneListingLayout()),
          onLongPress: () =>
              BlocProvider.of<AppThemeBloc>(context).add(SwapAppThemeEvent()),
          child: Center(
            child: Text(
              this.widget.subreddit,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      body: BlocProvider(
        builder: (context) => SubmissionListBloc(
          subreddit: this.widget.subreddit,
          limit: this.widget.limit,
        )..add(Fetch()),
        child: SubmissionListView(),
      ),
    );
  }
}
