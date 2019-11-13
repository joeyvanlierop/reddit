import 'package:flutter/material.dart';
import 'package:reddit/submission_listing/submission_listing.dart';

class SubmissionSeperator extends StatelessWidget {
  final SubmissionListingLayout submissionListingLayout;

  const SubmissionSeperator({
    Key key,
    @required this.submissionListingLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _generateSubmissionListing();
  }

  Widget _generateSubmissionListing() {
    switch (submissionListingLayout) {
      case SubmissionListingLayout.compact:
        return ListSeparator(
          thickness: 1,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        );
      case SubmissionListingLayout.expanded:
        return ListSeparator(
          thickness: 15,
        );
    }
  }
}

class ListSeparator extends StatelessWidget {
  final Color color;
  final double thickness;
  final EdgeInsets padding;

  const ListSeparator({
    Key key,
    this.color,
    this.thickness,
    this.padding,
  })  : assert(thickness >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.all(0.0),
      child: SizedBox(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: this.color ?? Theme.of(context).dividerColor,
                  width: this.thickness ?? 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
