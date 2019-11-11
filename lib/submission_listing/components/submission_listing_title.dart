import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

class SubmissionListingTitle extends StatelessWidget {
  final Submission submission;
  final EdgeInsets padding;
  final TextStyle style;

  const SubmissionListingTitle({
    Key key,
    @required this.submission,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: this.padding ?? EdgeInsets.zero,
        child: Text(
          this.submission.title,
          style: _stylizeTitle(context),
        ),
      ),
    );
  }

  TextStyle _stylizeTitle(BuildContext context) {
    if (this.submission.stickied) {
      return this.style != null
          ? this.style.copyWith(color: Colors.green)
          : Theme.of(context).textTheme.subhead.copyWith(color: Colors.green);
    } else {
      return this.style ?? Theme.of(context).textTheme.subhead;
    }
  }
}
