import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmissionListingActions extends StatelessWidget {
  final List<IconButton> icons;

  const SubmissionListingActions({
    Key key,
    @required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: icons,
    );
  }
}

class SubmissionListingUpvoteActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SubmissionListingDownvoteActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SubmissionListingMoreActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
