import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/submission_list/bloc/bloc.dart';
import 'package:reddit/submission_listing/submission_listing.dart';
import 'package:reddit/submission_listing/submission_seperator.dart';

import 'bloc/submission_list_event.dart';

class SubmissionListView extends StatefulWidget {
  @override
  _SubmissionListViewState createState() => _SubmissionListViewState();
}

class _SubmissionListViewState extends State<SubmissionListView> {
  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 5000.0;
  SubmissionListBloc _listBloc;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    _listBloc = BlocProvider.of<SubmissionListBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionListBloc, SubmissionListState>(
      builder: (context, state) {
        if (state is ListError) {
          return Center(
            child: Text('Retry'),
          );
        } else if (state is ListUninitialized) {
          return Center(
            child: LoadingIndicator(),
          );
        } else if (state is ListLoaded) {
          return ListView.separated(
            padding: EdgeInsets.all(0.0),
            cacheExtent: 750.0,
            controller: _scrollController,
            itemCount: state.outOfSubmissions
                ? state.submissions.length
                : state.submissions.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index >= state.submissions.length
                  ? LoadingIndicator()
                  : SubmissionListing(
                      submission: state.submissions[index],
                      submissionListingLayout:
                          BlocProvider.of<RedditPaneBloc>(context)
                              .state
                              .submissionListingLayout,
                    );
            },
            separatorBuilder: (context, index) => SubmissionSeperator(
              submissionListingLayout: BlocProvider.of<RedditPaneBloc>(context)
                  .state
                  .submissionListingLayout,
            ),
          );
        } else {
          return null;
        }
      },
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      _listBloc.add(Fetch());
    }
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
