import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/components/submission_listing_actions.dart';
import 'package:reddit/submission_listing/components/submission_listing_flair.dart';
import 'package:reddit/submission_listing/components/submission_listing_subtitle.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';
import 'package:reddit/submission_listing/components/submission_listing_title.dart';

class SubmissionListingExpanded extends StatelessWidget {
  final Submission submission;
  final double spacing;

  const SubmissionListingExpanded({
    Key key,
    @required this.submission,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: InkWell(
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SubmissionListingTitle(
                  submission: this.submission,
                  padding: EdgeInsets.only(bottom: this.spacing ?? 0),
                ),
                SubmissionListingFlair(
                  submission: this.submission,
                  flairType: FlairType.linkFlair,
                  margin: EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                  padding: EdgeInsets.all(4.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                SubmissionListingThumbnail(
                  submission: this.submission,
                  targetWidth: MediaQuery.of(context).size.width,
                  borderRadius: BorderRadius.circular(10.0),
                  padding: EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: this.spacing ?? 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SubmissionListingSubtitle(
                        submission: this.submission,
                        direction: Axis.vertical,
                      ),
                      SubmissionListingActionButtons(
                        submission: this.submission,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
