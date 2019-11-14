import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/app_theme/bloc/bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/submission_list/bloc/submission_list_bloc.dart';
import 'package:reddit/submission_list/submission_list_view.dart';

import 'bloc/bloc.dart';

class SubmissionListPage extends StatefulWidget {
  final String subreddit;
  final int limit;

  const SubmissionListPage({
    Key key,
    @required this.subreddit,
    this.limit = 25,
  }) : super(key: key);

  @override
  _SubmissionListPageState createState() => _SubmissionListPageState();
}

class _SubmissionListPageState extends State<SubmissionListPage>
    with AutomaticKeepAliveClientMixin<SubmissionListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            pinned: false,
            title: InkWell(
              onDoubleTap: () => BlocProvider.of<RedditPaneBloc>(context)
                  .add(SwapRedditPaneListingLayout()),
              onLongPress: () => BlocProvider.of<AppThemeBloc>(context)
                  .add(SwapAppThemeEvent()),
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
          BlocProvider(
            builder: (context) => SubmissionListBloc(
              subreddit: this.widget.subreddit,
              limit: this.widget.limit,
            )..add(Fetch()),
            child: SubmissionListView(),
          ),
        ],
      ),
//      appBar: AppBar(
//        title: InkWell(
//          onDoubleTap: () => BlocProvider.of<RedditPaneBloc>(context)
//              .add(SwapRedditPaneListingLayout()),
//          onLongPress: () =>
//              BlocProvider.of<AppThemeBloc>(context).add(SwapAppThemeEvent()),
//          child: Center(
//            child: Text(
//              this.widget.subreddit,
//              style: TextStyle(
//                fontWeight: FontWeight.w700,
//              ),
//            ),
//          ),
//        ),
//      ),
//      body: BlocProvider(
//        builder: (context) => SubmissionListBloc(
//          subreddit: this.widget.subreddit,
//          limit: this.widget.limit,
//        )..add(Fetch()),
//        child: SubmissionListView(),
//      ),
    );
  }
}
