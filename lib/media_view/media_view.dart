import 'package:cached_network_image/cached_network_image.dart';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reddit/submission_listing/components/submission_listing_thumbnail.dart';

class MediaViewContainer extends StatefulWidget {
  final Submission submission;
  final ThumbnailImage thumbnailImage;

  const MediaViewContainer({
    Key key,
    @required this.submission,
    @required this.thumbnailImage,
  }) : super(key: key);

  @override
  _MediaViewContainerState createState() => _MediaViewContainerState();
}

class _MediaViewContainerState extends State<MediaViewContainer>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  double xOffset = 0.0;
  double yOffset = 0.0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 1.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animationController.reset();
        Navigator.of(context).pop();
      },
      onPanUpdate: (panUpdateInfo) {
        animationController.reset();

        setState(() {
          yOffset += panUpdateInfo.delta.dy;
        });
      },
      onPanEnd: (panEndInfo) {
        if (panEndInfo.velocity.pixelsPerSecond.dy.abs() > 1500) {
          Navigator.of(context).pop(context);
        } else {
          animationController.reset();
          animationController.forward();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              top: yOffset *= animation.value,
              child: SizedBox.expand(
                child: MediaView(
                  submission: widget.submission,
                  thumbnailImage: widget.thumbnailImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          child: Hero(
            tag: submission.fullname,
            child: CachedNetworkImage(
              imageUrl: submission.preview.last.resolutions.last.url.toString(),
              placeholder: (context, string) => thumbnailImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
