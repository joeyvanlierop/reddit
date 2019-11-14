import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit/ui/text_icon.dart';

// TODO: Improve and globalize the number format
final NumberFormat scoreFormat = NumberFormat.compact();

class SubmissionListingSubtitle extends StatelessWidget {
  final Submission submission;
  final TextStyle style;
  final Axis direction;
  final EdgeInsets padding;
  final double itemSpacing;
  final double rowSpacing;

  const SubmissionListingSubtitle({
    Key key,
    @required this.submission,
    this.style,
    this.direction,
    this.padding = EdgeInsets.zero,
    this.itemSpacing = 8.0,
    this.rowSpacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Wrap(
        direction: direction ?? Axis.horizontal,
        spacing: itemSpacing,
        runSpacing: rowSpacing,
        children: <Widget>[
          // TODO: See if a custom text style for the subtitle can be defined in the theme
          InkWell(
            onTap: () => print(submission.subreddit.displayName),
            child: Text(
              submission.subreddit.displayName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          // TODO: Add the potential to rearrange the icons
          IgnorePointer(
            child: Wrap(
              spacing: itemSpacing,
              children: <Widget>[
                TextIcon(
                  text: scoreFormat.format(submission.score),
                  icon: Icons.arrow_upward,
                ),
                TextIcon(
                  text: submission.numComments.toString(),
                  icon: Icons.chat_bubble_outline,
                ),
                TextIcon(
                  text: DateTime.now()
                          .difference(submission.createdUtc)
                          .inHours
                          .toString() +
                      'h',
                  icon: Icons.access_time,
                ),
              ],
            ),
          ),
          _getAwards(context, spacing: itemSpacing),
        ],
      ),
    );
  }

  Wrap _getAwards(
    BuildContext context, {
    double spacing,
  }) {
    List<Widget> awardItems = [];

    if (submission.silver != null) {
      awardItems.add(
        TextIcon(
          text: submission.silver.toString(),
          icon: Icons.stars,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.grey.shade500),
        ),
      );
    }

    if (submission.gold != null) {
      awardItems.add(
        TextIcon(
          text: submission.gold.toString(),
          icon: Icons.stars,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.yellow.shade600),
        ),
      );
    }

    if (submission.platinum != null) {
      awardItems.add(
        TextIcon(
          text: submission.platinum.toString(),
          icon: Icons.stars,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(color: Colors.green),
        ),
      );
    }

    return Wrap(
      spacing: spacing ?? 0,
      children: <Widget>[
        ...awardItems,
      ],
    );
  }
}
