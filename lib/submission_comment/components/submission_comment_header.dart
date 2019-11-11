import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit/ui/text_icon.dart';

// TODO: Improve and globalize the number format
final NumberFormat scoreFormat = new NumberFormat.compact();

class SubmissionCommentHeader extends StatelessWidget {
  final Comment comment;
  final EdgeInsets padding;
  final TextStyle style;
  final double itemSpacing;
  final double rowSpacing;

  const SubmissionCommentHeader({
    Key key,
    @required this.comment,
    this.padding = EdgeInsets.zero,
    this.itemSpacing = 8.0,
    this.rowSpacing = 8.0,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: this.padding,
        child: Wrap(
          spacing: itemSpacing,
          runSpacing: rowSpacing,
          children: <Widget>[
            Text(
              comment.author,
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            if (comment.authorFlairText != null)
              Text(comment.authorFlairText,
                  style: Theme.of(context).textTheme.subtitle),
            TextIcon(
              text: scoreFormat.format(this.comment.score),
              icon: Icons.arrow_upward,
            ),
            TextIcon(
              text: DateTime.now()
                      .difference(this.comment.createdUtc)
                      .inHours
                      .toString() +
                  'h',
              icon: Icons.access_time,
            ),
          ],
        ),
      ),
    );
  }
}
