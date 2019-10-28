import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubmissionListingThumbnail extends StatelessWidget {
  final Submission submission;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const SubmissionListingThumbnail({
    Key key,
    @required this.submission,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (submission.isSelf || submission.preview.length <= 0) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    PreviewImage highQuality = submission.preview.first.resolutions.last;
    CachedNetworkImageProvider image =
        CachedNetworkImageProvider(Uri.decodeFull(highQuality.url.toString()));

    return Container(
      width: this.width ?? null,
      height: this.width ?? null,
      child: Padding(
        padding: this.padding ?? EdgeInsets.zero,
        child: AspectRatio(
          aspectRatio: highQuality.width / highQuality.height,
          child: Material(
            borderRadius: this.borderRadius ?? EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            child: Ink.image(
              image: image,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: () {
                  print('Thumbnail');
                },
                child: _blurNsfw(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _blurNsfw() {
    if (submission.over18) {
      return BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.red.withOpacity(0.2)),
          ));
    } else {
      return null;
    }
  }
}
