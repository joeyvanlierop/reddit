import 'package:cached_network_image/cached_network_image.dart';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';

class MediaView extends StatelessWidget {
  final Submission submission;
  final ThumbnailImage thumbnailImage;

  const MediaView({
    Key key,
    @required this.submission,
    @required this.thumbnailImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Dismissible(
          key: Key(this.submission.fullname),
          direction: DismissDirection.vertical,
          movementDuration: new Duration(seconds: 1),
          confirmDismiss: (direction) async {
            Navigator.maybePop(context);
            return false;
          },
          child: SizedBox(
            width: double.infinity,
            child: Hero(
              tag: this.submission.fullname,
              child: CachedNetworkImage(
                imageUrl: this
                    .submission
                    .preview
                    .last
                    .resolutions
                    .last
                    .url
                    .toString(),
                placeholder: (context, string) => this.thumbnailImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
