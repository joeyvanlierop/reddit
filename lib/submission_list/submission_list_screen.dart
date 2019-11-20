import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/app_theme/bloc/bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/status_bar_style/bloc/bloc.dart';
import 'package:reddit/submission_list/bloc/submission_list_bloc.dart';
import 'package:reddit/submission_list/submission_list_view.dart';

import 'bloc/bloc.dart';

class SubmissionListScreen extends StatefulWidget {
  final String subreddit;
  final int limit;
  final double scrollThreshold = 5000.0;

  const SubmissionListScreen({
    Key key,
    @required this.subreddit,
    this.limit = 25,
  }) : super(key: key);

  @override
  _SubmissionListScreenState createState() => _SubmissionListScreenState();
}

class _SubmissionListScreenState extends State<SubmissionListScreen>
    with AutomaticKeepAliveClientMixin<SubmissionListScreen> {
  @override
  bool get wantKeepAlive => true;
  ScrollController scrollController;
  SubmissionListBloc submissionListBloc;

  @override
  void initState() {
    super.initState();

    submissionListBloc = SubmissionListBloc(
      subreddit: widget.subreddit,
      limit: widget.limit,
    )..add(Fetch());
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.dispose();
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;

    if (maxScroll - currentScroll <= widget.scrollThreshold) {
      submissionListBloc.add(Fetch());
    }
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: false,
      title: InkWell(
        onDoubleTap: () => BlocProvider.of<RedditPaneBloc>(context)
            .add(SwapRedditPaneListingLayout()),
        onLongPress: () async {
          BlocProvider.of<AppThemeBloc>(context).add(SwapAppThemeEvent());
          BlocProvider.of<StatusBarStyleBloc>(context)
              .add(SwapStatusBarStyleEvent());
        },
        child: Center(
          child: Text(
            widget.subreddit,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<SubmissionListBloc>(
      builder: (context) => submissionListBloc,
      child: Scaffold(
        body: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          cacheExtent: 300,
          controller: scrollController,
          slivers: <Widget>[
            _buildAppBar(),
            SubmissionListView(),
          ],
        ),
      ),
    );
  }
}
