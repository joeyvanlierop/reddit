import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/layouts/submission_listing_compact.dart';
import 'package:reddit/submission_listing/layouts/submission_listing_expanded.dart';

enum SubmissionListingLayout {
  compact,
  expanded,
}

class SubmissionListing extends StatelessWidget {
  final Submission submission;
  final SubmissionListingLayout submissionListingLayout;

  const SubmissionListing({
    Key key,
    @required this.submission,
    @required this.submissionListingLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _generateSubmissionListing();
  }

  Widget _generateSubmissionListing() {
    switch (submissionListingLayout) {
      case SubmissionListingLayout.compact:
        return SubmissionListingCompact(submission: this.submission);
      case SubmissionListingLayout.expanded:
        return SubmissionListingExpanded(submission: this.submission);
      default:
        return null;
    }
  }
}
