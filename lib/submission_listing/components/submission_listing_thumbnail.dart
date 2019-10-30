import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SubmissionListingThumbnail extends StatefulWidget {
  final Submission submission;
  final double targetWidth;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const SubmissionListingThumbnail({
    Key key,
    @required this.submission,
    @required this.targetWidth,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  _SubmissionListingThumbnailState createState() =>
      _SubmissionListingThumbnailState();
}

class _SubmissionListingThumbnailState
    extends State<SubmissionListingThumbnail> {
  PreviewImage previewUrl;

  @override
  Widget build(BuildContext context) {
    if (widget.submission.isSelf ||
        widget.submission.preview.length <= 0 ||
        widget.submission.preview.first.resolutions.length <= 0) {
      return Container(
        width: 0,
        height: 0,
      );
    }

    previewUrl = widget.submission.preview.first.resolutions.firstWhere(
        (res) => res.width >= widget.targetWidth,
        orElse: () => widget.submission.preview.first.resolutions.last);

    return Container(
      width: this.widget.width ?? null,
      height: this.widget.width ?? null,
      child: Padding(
        padding: this.widget.padding ?? EdgeInsets.zero,
        child: AspectRatio(
          aspectRatio: previewUrl.width / previewUrl.height,
          child: Material(
            borderRadius: this.widget.borderRadius ?? EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl: Uri.decodeFull(previewUrl.url.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                if (widget.submission.over18)
                  Positioned.fill(
                    child: _NsfwFilter(),
                  ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NsfwFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
      child: new Container(
        decoration: new BoxDecoration(color: Colors.red.withOpacity(0.2)),
      ),
    );
  }
}
