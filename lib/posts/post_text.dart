import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reddit/posts/post_data.dart';

final double subtitleItemSpacing = 12.0;
final double subtitleIconSpacing = 2.0;
final NumberFormat scoreFormat = new NumberFormat.compact();

class PostText extends StatelessWidget {
  final PostData postData;

  const PostText({
    Key key,
    @required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PostTitle(
          title: this.postData.title,
        ),
        SizedBox(
          height: 8.0,
        ),
        PostSubtitle(
          postData: this.postData,
        ),
      ],
    );
  }
}

class PostTitle extends StatelessWidget {
  const PostTitle({
    Key key,
    @required this.title,
    this.style,
  }) : super(key: key);

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(this.title,
        style: this.style ?? Theme.of(context).textTheme.subhead);
  }
}

class PostSubtitle extends StatelessWidget {
  final PostData postData;
  final TextStyle style;

  const PostSubtitle({
    Key key,
    @required this.postData,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: subtitleItemSpacing,
      runSpacing: 4.0,
      children: <Widget>[
        PostSubtitleItem(
          text: this.postData.subreddit,
          style: Theme.of(context)
              .textTheme
              .subtitle
              .copyWith(fontWeight: FontWeight.w500),
        ),
        Wrap(
          spacing: subtitleItemSpacing,
          children: <Widget>[
            PostSubtitleItem(
              text: scoreFormat.format(this.postData.score),
              icon: Icons.arrow_upward,
            ),
            PostSubtitleItem(
              text: this.postData.comments.toString(),
              icon: Icons.chat_bubble_outline,
            ),
            PostSubtitleItem(
              text: this.postData.age.toString(),
              icon: Icons.access_time,
            ),
          ],
        ),
      ],
    );
  }
}

class PostSubtitleItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final IconData icon;

  const PostSubtitleItem({
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
