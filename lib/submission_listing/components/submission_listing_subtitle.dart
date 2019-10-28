import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final double subtitleIconSpacing = 2.0;
final double subtitleItemSpacing = 12.0;
// TODO: Improve the number format
final NumberFormat scoreFormat = new NumberFormat.compact();

class SubmissionListingSubtitle extends StatelessWidget {
  final Submission submission;
  final TextStyle style;
  final EdgeInsets padding;
  final Axis direction;

  const SubmissionListingSubtitle({
    Key key,
    @required this.submission,
    this.style,
    this.padding,
    this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.zero,
      child: Wrap(
        direction: this.direction ?? Axis.horizontal,
        spacing: subtitleItemSpacing,
        runSpacing: 4.0,
        children: <Widget>[
          // TODO: See if a custom text style for the subtitle can be defined in the theme
          InkWell(
            onTap: () => print(submission.subreddit.displayName),
            child: _SubmissionListingSubtitleItem(
              text: this.submission.subreddit.displayName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          // TODO: Add the potential to rearrange the icons
          IgnorePointer(
            child: Wrap(
              spacing: subtitleItemSpacing,
              children: <Widget>[
                _SubmissionListingSubtitleItem(
                  text: scoreFormat.format(this.submission.score),
                  icon: Icons.arrow_upward,
                ),
                _SubmissionListingSubtitleItem(
                  text: this.submission.numComments.toString(),
                  icon: Icons.chat_bubble_outline,
                ),
                _SubmissionListingSubtitleItem(
                  text: DateTime.now()
                          .difference(this.submission.createdUtc)
                          .inHours
                          .toString() +
                      'h',
                  icon: Icons.access_time,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmissionListingSubtitleItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final IconData icon;

  const _SubmissionListingSubtitleItem({
    Key key,
    @required this.text,
    this.style,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: subtitleIconSpacing,
        children: <Widget>[
          if (this.icon != null)
            Icon(
              this.icon,
              size: this.style ?? Theme.of(context).textTheme.subtitle.fontSize,
              color: this.style ?? Theme.of(context).textTheme.subtitle.color,
            ),
          Text(
            this.text,
            style: this.style ?? Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }
}
