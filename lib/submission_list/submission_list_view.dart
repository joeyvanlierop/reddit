import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/submission_list/bloc/bloc.dart';
import 'package:reddit/submission_listing/submission_listing.dart';
import 'package:reddit/submission_listing/submission_seperator.dart';

class SubmissionListView extends StatefulWidget {
  @override
  _SubmissionListViewState createState() => _SubmissionListViewState();
}

class _SubmissionListViewState extends State<SubmissionListView> {
  Widget _buildSubmission(
      {@required Submission submission, bool divider = true}) {
    return Column(
      children: <Widget>[
        SubmissionListing(
          submission: submission,
          submissionListingLayout: BlocProvider.of<RedditPaneBloc>(context)
              .state
              .submissionListingLayout,
        ),
        if (divider)
          SubmissionSeperator(
            submissionListingLayout: BlocProvider.of<RedditPaneBloc>(context)
                .state
                .submissionListingLayout,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionListBloc, SubmissionListState>(
      builder: (context, state) {
        if (state is ListError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Retry'),
            ),
          );
        } else if (state is ListUninitialized) {
          return SliverToBoxAdapter(
            child: Center(
              child: LoadingIndicator(),
            ),
          );
        } else if (state is ListLoaded) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return index >= state.submissions.length
                    ? LoadingIndicator()
                    : _buildSubmission(submission: state.submissions[index]);
              },
              childCount: state.outOfSubmissions
                  ? state.submissions.length
                  : state.submissions.length + 1,
            ),
//            physics: AlwaysScrollableScrollPhysics(),
//            padding: EdgeInsets.all(0.0),
//            cacheExtent: 500.0,
//            controller: _listViewController,
//            separatorBuilder: (context, index) => SubmissionSeperator(
//              submissionListingLayout: BlocProvider.of<RedditPaneBloc>(context)
//                  .state
//                  .submissionListingLayout,
//            ),
          );
        } else {
          return null;
        }
      },
    );
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
