import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final double contentMetaItemsSpacing = 8.0;
final double contentMetaItemsIconSpacing = 2.0;
final NumberFormat upvotesFormat = new NumberFormat.compact();

class PostContent extends StatelessWidget {
  const PostContent({
    Key key,
    this.title,
    this.subreddit,
    this.upvotes,
    this.comments,
    this.age,
  }) : super(key: key);

  final String title;
  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PostContentTitle(
          title: this.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        PostContentMeta(
          subreddit: this.subreddit,
          upvotes: this.upvotes,
          comments: this.comments,
          age: this.age,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class PostContentTitle extends StatelessWidget {
  const PostContentTitle({
    Key key,
    @required this.title,
    this.style,
  }) : super(key: key);

  final String title;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(this.title, style: this.style);
  }
}

class PostContentMeta extends StatelessWidget {
  const PostContentMeta({
    Key key,
    @required this.subreddit,
    @required this.upvotes,
    @required this.comments,
    @required this.age,
    this.style,
  }) : super(key: key);

  final String subreddit;
  final int upvotes;
  final int comments;
  final int age;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: contentMetaItemsSpacing,
      runSpacing: 4.0,
      children: <Widget>[
        PostContentMetaItem(
          text: this.subreddit,
          style: this.style.copyWith(fontWeight: FontWeight.w600),
        ),
        Wrap(
          spacing: contentMetaItemsSpacing,
          children: <Widget>[
            PostContentMetaItem(
              text: upvotesFormat.format(upvotes),
              style: this.style,
              icon: Icons.arrow_upward,
            ),
            PostContentMetaItem(
              text: this.comments.toString(),
              style: this.style,
              icon: Icons.chat_bubble_outline,
            ),
            PostContentMetaItem(
              text: this.age.toString(),
              style: this.style,
              icon: Icons.access_time,
            ),
          ],
        ),
      ],
    );
  }
}

class PostContentMetaItem extends StatelessWidget {
  final String text;
  final TextStyle style;
  final IconData icon;

  const PostContentMetaItem({
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
        spacing: contentMetaItemsIconSpacing,
        children: <Widget>[
          if (this.icon != null)
            Icon(
              this.icon,
              size: this.style.fontSize,
              color: this.style.color,
            ),
          Text(
            this.text,
            style: this.style,
          ),
        ],
      ),
    );
  }
}
