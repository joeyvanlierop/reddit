import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/reddit_pane/bloc/bloc.dart';
import 'package:reddit/reddit_pane/reddit_pane_view.dart';
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
    this.spacing = 4.0,
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
                BlocProvider.of<RedditPaneBloc>(context)
                    .add(SetRedditPaneSubmission(
                  submission: this.submission,
                ));

                return RedditPane.pageController.animateToPage(1,
                    curve: Curves.decelerate,
                    duration: Duration(milliseconds: 400));
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
                      Wrap(
                        spacing: 10.0,
                        children: <Widget>[
                          if (submission.linkFlairText != null)
                            SubmissionListingFlair(
                              submission: this.submission,
                              flairType: FlairType.linkFlair,
                              margin: EdgeInsets.symmetric(
                                  vertical: this.spacing ?? 0),
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          if (submission.over18)
                            SubmissionListingFlair(
                              submission: this.submission,
                              flairType: FlairType.nsfwFlair,
                              margin: EdgeInsets.symmetric(
                                  vertical: this.spacing ?? 0),
                              padding: EdgeInsets.all(4.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          if (submission.spoiler)
                            SubmissionListingFlair(
                              submission: this.submission,
                              flairType: FlairType.spoilerFlair,
                              margin: EdgeInsets.symmetric(
                                  vertical: this.spacing ?? 0),
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
