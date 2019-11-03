import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reddit/media_view/blur_page_route.dart';
import 'package:reddit/media_view/media_view.dart';

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

    return Container(
      width: this.widget.width ?? null,
      height: this.widget.width ?? null,
      child: Padding(
        padding: this.widget.padding ?? EdgeInsets.zero,
        child: _Thumbnail(
          submission: widget.submission,
          targetWidth: widget.targetWidth,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final Submission submission;
  final double targetWidth;
  final BorderRadius borderRadius;

  const _Thumbnail({
    Key key,
    @required this.submission,
    this.targetWidth,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreviewImage previewImage = this
        .submission
        .preview
        .first
        .resolutions
        .firstWhere((res) => res.width >= this.targetWidth,
            orElse: () => this.submission.preview.first.resolutions.last);

    ThumbnailImage thumbnailImage = ThumbnailImage(
      submission: this.submission,
      previewImage: previewImage,
    );

    return AspectRatio(
      aspectRatio: previewImage.width / previewImage.height,
      child: Material(
        color: Colors.transparent,
        borderRadius: this.borderRadius ?? EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child: Hero(
          tag: this.submission.fullname,
          child: Stack(
            children: [
              Positioned.fill(
                child: thumbnailImage,
              ),
              if (submission.over18) _NsfwFilter(),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      BlurPageRoute(
                        builder: (context) => MediaView(
                          submission: this.submission,
                          thumbnailImage: thumbnailImage,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThumbnailImage extends StatelessWidget {
  final Submission submission;
  final PreviewImage previewImage;
  final BoxFit fit;

  const ThumbnailImage({
    Key key,
    @required this.submission,
    @required this.previewImage,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _getImage(),
      fit: this.fit,
    );
  }

  String _getImage() {
//    return this.submission.url.toString().endsWith('.gif')
//        ? this.submission.url.toString()
//        : this.previewImage.url.toString();
    return this.previewImage.url.toString();
  }
}

class _NsfwFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          color: Colors.red.withOpacity(0.5),
        ),
      ),
    );
  }
}
