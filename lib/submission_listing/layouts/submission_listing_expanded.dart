import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/components/submission_listing_actions.dart';
import 'package:reddit/submission_listing/components/submission_listing_subtitle.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';
import 'package:reddit/submission_listing/components/submission_listing_title.dart';

class SubmissionListingExpanded extends StatelessWidget {
  final Submission submission;

  const SubmissionListingExpanded({
    Key key,
    @required this.submission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 29, 29, 30),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: InkWell(
              onTap: () => print('Post'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Wrap(
              runSpacing: 15.0,
              children: <Widget>[
                SubmissionListingTitle(
                  submission: this.submission,
                ),
                SubmissionListingThumbnail(
                  submission: this.submission,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SubmissionListingSubtitle(
                      submission: this.submission,
                      direction: Axis.vertical,
                    ),
                    SubmissionListingActions(
                      icons: [
                        new IconButton(
                          icon: new Icon(Icons.arrow_upward),
                          onPressed: () => print('Upvote'),
                          color: Theme.of(context).textTheme.subtitle.color,
                        ),
                        new IconButton(
                          icon: new Icon(Icons.arrow_downward),
                          onPressed: () => print('Downvote'),
                          color: Theme.of(context).textTheme.subtitle.color,
                        ),
                        new IconButton(
                          icon: new Icon(Icons.more_vert),
                          onPressed: () => print('More'),
                          color: Theme.of(context).textTheme.subtitle.color,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
