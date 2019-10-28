import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/components/submission_listing_subtitle.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';
import 'package:reddit/submission_listing/components/submission_listing_title.dart';

class SubmissionListingCompact extends StatelessWidget {
  final Submission submission;

  const SubmissionListingCompact({
    Key key,
    @required this.submission,
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
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      SubmissionListingSubtitle(
                        submission: this.submission,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                SubmissionListingThumbnail(
                  submission: this.submission,
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
