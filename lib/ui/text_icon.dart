import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextStyle style;
  final double spacing;

  const TextIcon({
    Key key,
    @required this.text,
    @required this.icon,
    this.style,
    this.spacing = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: spacing,
        children: <Widget>[
          Icon(
            icon,
            size: style != null
                ? style.fontSize
                : Theme.of(context).textTheme.subtitle.fontSize,
            color: style != null
                ? style.color
                : Theme.of(context).textTheme.subtitle.color,
          ),
          Text(
            text,
            style: style ?? Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }
}
