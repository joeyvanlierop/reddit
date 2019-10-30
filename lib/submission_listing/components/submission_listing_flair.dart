import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

class SubmissionListingTitleFlair extends StatelessWidget {
  final Submission submission;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color color;
  final TextStyle style;

  const SubmissionListingTitleFlair({
    Key key,
    @required this.submission,
    this.margin,
    this.padding,
    this.borderRadius,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (submission.linkFlairText == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    return Padding(
      padding: this.margin,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: Padding(
          padding: padding,
          child: Text(
            this.submission.linkFlairText,
            style: this.style ?? Theme.of(context).textTheme.subtitle,
          ),
        ),
      ),
    );
  }
}
