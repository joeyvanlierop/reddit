import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'layouts/submission_listing_expanded.dart';

class SubmissionListing extends StatefulWidget {
  final Submission submission;

  const SubmissionListing({
    Key key,
    @required this.submission,
  }) : super(key: key);

  @override
  _SubmissionListingState createState() => _SubmissionListingState();
}

class _SubmissionListingState extends State<SubmissionListing> {
  SlidableController slidableController;

  @override
  void initState() {
    super.initState();

    slidableController = SlidableController(
        onSlideAnimationChanged: handleSlideAnimationChanged);
  }

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    print(slideAnimation.value);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      showAllActionsThreshold: 1.0,
      actionExtentRatio: 1.0,
      actions: <Widget>[
        GestureAction(
          color: Colors.blue,
          icon: Icons.ac_unit,
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
        ),
      ],
      secondaryActions: <Widget>[
        GestureAction(
          color: Colors.red,
          icon: Icons.ac_unit,
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
        ),
      ],
      child: SubmissionListingExpanded(
        submission: this.widget.submission,
        spacing: 4.0,
      ),
    );
  }
}

class GestureAction extends StatefulWidget {
  final Color color;
  final IconData icon;
  final Alignment alignment;
  final EdgeInsets padding;
  final Function callback;

  const GestureAction({
    Key key,
    @required this.color,
    @required this.icon,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
    this.callback,
  }) : super(key: key);

  @override
  _GestureActionState createState() => _GestureActionState();
}

class _GestureActionState extends State<GestureAction> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      child: Align(
        alignment: widget.alignment,
        child: Padding(
          padding: widget.padding,
          child: Icon(
            widget.icon,
          ),
        ),
      ),
    );
  }
}
