import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/components/submission_listing_flair.dart';
import 'package:reddit/submission_listing/components/submission_listing_subtitle.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';
import 'package:reddit/submission_listing/components/submission_listing_title.dart';

class SubmissionListingCompact extends StatelessWidget {
  final Submission submission;
  final double spacing;

  const SubmissionListingCompact({
    Key key,
    @required this.submission,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: InkWell(
              onTap: () {
                print("Post");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SubmissionListingTitle(
                        submission: this.submission,
                        padding: EdgeInsets.only(bottom: this.spacing ?? 0),
                      ),
                      SubmissionListingTitleFlair(
                        submission: this.submission,
                        margin:
                            EdgeInsets.symmetric(vertical: this.spacing ?? 0),
                        padding: EdgeInsets.all(4.0),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      SubmissionListingSubtitle(
                        submission: this.submission,
                        padding: EdgeInsets.only(top: this.spacing ?? 0),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                SubmissionListingThumbnail(
                  submission: this.submission,
                  targetWidth: 70.0,
                  width: 70.0,
                  height: 70.0,
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
