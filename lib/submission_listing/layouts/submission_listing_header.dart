import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/components/submission_listing_flair.dart';
import 'package:reddit/submission_listing/components/submission_listing_subtitle.dart';
import 'package:reddit/submission_listing/components/submission_listing_title.dart';

class SubmissionListingHeader extends StatelessWidget {
  final Submission submission;
  final double spacing;

  const SubmissionListingHeader({
    Key key,
    @required this.submission,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SubmissionListingTitle(
                  submission: this.submission,
                  padding: EdgeInsets.only(bottom: this.spacing ?? 0),
                ),
                Wrap(
                  spacing: 10.0,
                  children: <Widget>[
                    if (submission.linkFlairText != null)
                      SubmissionListingFlair(
                        submission: this.submission,
                        flairType: FlairType.linkFlair,
                        margin:
                            EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                        padding: EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    if (submission.over18)
                      SubmissionListingFlair(
                        submission: this.submission,
                        flairType: FlairType.nsfwFlair,
                        margin:
                            EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                        padding: EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    if (submission.spoiler)
                      SubmissionListingFlair(
                        submission: this.submission,
                        flairType: FlairType.spoilerFlair,
                        margin:
                            EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                        padding: EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                  ],
                ),
                SubmissionListingSubtitle(
                  submission: this.submission,
                  padding: EdgeInsets.only(top: this.spacing ?? 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
