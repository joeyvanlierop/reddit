import 'package:draw/draw.dart';
import 'package:equatable/equatable.dart';
import 'package:reddit/submission_listing/submission_listing.dart';

class RedditPaneState extends Equatable {
  final Submission submission;
  final SubmissionListingLayout submissionListingLayout;

  RedditPaneState({
    this.submission,
    this.submissionListingLayout,
  });

  @override
  List<Object> get props => [
        submission,
        submissionListingLayout,
      ];
}
