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

  SetRedditPaneSubmission({this.submission});

  @override
  List<Object> get props => [this.submission];
}

class SetRedditPaneListingLayout extends RedditPaneEvent {
  final SubmissionListingLayout submissionListingLayout;

  SetRedditPaneListingLayout({this.submissionListingLayout});

  @override
  List<Object> get props => [this.submissionListingLayout];
}

class SwapRedditPaneListingLayout extends RedditPaneEvent {}
