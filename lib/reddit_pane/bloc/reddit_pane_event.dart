import 'package:draw/draw.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit/submission_listing/submission_listing.dart';

abstract class RedditPaneEvent extends Equatable {
  const RedditPaneEvent();

  @override
  List<Object> get props => null;
}

class SetRedditPaneSubmission extends RedditPaneEvent {
  final Submission submission;

  const SetRedditPaneSubmission({this.submission});

  @override
  List<Object> get props => [submission];
}

class SetRedditPaneListingLayout extends RedditPaneEvent {
  final SubmissionListingLayout submissionListingLayout;

  const SetRedditPaneListingLayout({this.submissionListingLayout});

  @override
  List<Object> get props => [submissionListingLayout];
}

class SwapRedditPaneListingLayout extends RedditPaneEvent {}
