import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:reddit/submission_listing/submission_listing.dart';

import './bloc.dart';

class RedditPaneBloc extends Bloc<RedditPaneEvent, RedditPaneState> {
  @override
  RedditPaneState get initialState =>
      RedditPaneState(submissionListingLayout: SubmissionListingLayout.compact);

  @override
  Stream<RedditPaneState> mapEventToState(
    RedditPaneEvent event,
  ) async* {
    if (event is SetRedditPaneSubmission) {
      yield RedditPaneState(
        submission: event.submission,
        submissionListingLayout: state.submissionListingLayout,
      );
    } else if (event is SetRedditPaneListingLayout) {
      yield RedditPaneState(
        submission: state.submission,
        submissionListingLayout: event.submissionListingLayout,
      );
    } else if (event is SwapRedditPaneListingLayout) {
      yield RedditPaneState(
        submission: state.submission,
        submissionListingLayout: _swapLayout(state),
      );
    }
  }

  SubmissionListingLayout _swapLayout(RedditPaneState state) {
    return state.submissionListingLayout == SubmissionListingLayout.compact
        ? SubmissionListingLayout.expanded
        : SubmissionListingLayout.compact;
  }
}
