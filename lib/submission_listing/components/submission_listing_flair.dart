import 'package:draw/draw.dart';
import 'package:flutter/material.dart';

enum FlairType {
  linkFlair,
  nsfwFlair,
  spoilerFlair,
}

final flairStyle = {
  FlairType.linkFlair: FlairStyle(
    color: Colors.grey.withOpacity(0.2),
  ),
  FlairType.nsfwFlair: FlairStyle(
    color: Colors.red.shade800.withOpacity(0.2),
    textColor: Colors.red,
  ),
  FlairType.spoilerFlair: FlairStyle(
    color: Colors.yellow.shade800.withOpacity(0.2),
    textColor: Colors.amber,
  ),
};

class FlairStyle {
  final Color color;
  final Color textColor;

  const FlairStyle({
    this.color,
    this.textColor,
  });
}

class SubmissionListingFlair extends StatelessWidget {
  final Submission submission;
  final FlairType flairType;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const SubmissionListingFlair({
    Key key,
    @required this.submission,
    @required this.flairType,
    this.margin,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;

    switch (flairType) {
      case FlairType.linkFlair:
        text = submission.linkFlairText;
        break;
      case FlairType.nsfwFlair:
        text = submission.over18 ? 'NSFW' : null;
        break;
      case FlairType.spoilerFlair:
        text = submission.spoiler ? 'Spoiler' : null;
        break;
    }

    if (text == null) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    return IgnorePointer(
      child: Padding(
        padding: this.margin,
        child: Container(
          decoration: BoxDecoration(
            color: flairStyle[flairType].color,
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          child: Padding(
            padding: padding,
            child: Text(
              text,
              style: flairStyle[flairType].textColor != null
                  ? Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: flairStyle[flairType].textColor)
                  : Theme.of(context).textTheme.subtitle,
            ),
          ),
        ),
      ),
    );
  }
}
