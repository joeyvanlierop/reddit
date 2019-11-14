import 'package:draw/draw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmissionListingActionButtons extends StatefulWidget {
  final Submission submission;

  const SubmissionListingActionButtons({
    Key key,
    @required this.submission,
  }) : super(key: key);

  @override
  _SubmissionListingActionButtonsState createState() =>
      _SubmissionListingActionButtonsState();
}

class _SubmissionListingActionButtonsState
    extends State<SubmissionListingActionButtons> {
  VoteState voteState;

  @override
  Widget build(BuildContext context) {
    voteState = widget.submission.vote;

    return Wrap(
      children: <Widget>[
        SubmissionListingActionButton(
          iconData: Icons.arrow_upward,
          clickedColor: Colors.red,
          iconSize: 25.0,
          currentVote: voteState,
          targetVote: VoteState.upvoted,
          callback: (vote) => _setVote(vote),
        ),
        SubmissionListingActionButton(
          iconData: Icons.arrow_downward,
          clickedColor: Colors.blue,
          iconSize: 25.0,
          currentVote: voteState,
          targetVote: VoteState.downvoted,
          callback: (vote) => _setVote(vote),
        ),
        SubmissionListingActionButton(
          iconData: Icons.more_vert,
          iconSize: 25.0,
        ),
      ],
    );
  }

  _setVote(VoteState targetVote) async {
    switch (targetVote) {
      case VoteState.none:
        await widget.submission.clearVote(waitForResponse: false);
        break;
      case VoteState.upvoted:
        await widget.submission.upvote(waitForResponse: false);
        break;
      case VoteState.downvoted:
        await widget.submission.downvote(waitForResponse: false);
        break;
    }

    setState(() {});
  }
}

class SubmissionListingActionButton extends StatefulWidget {
  final IconData iconData;
  final double iconSize;
  final Color color;
  final Color clickedColor;
  final Function callback;
  final VoteState currentVote;
  final VoteState targetVote;

  const SubmissionListingActionButton({
    @required this.iconData,
    this.iconSize,
    this.color,
    this.clickedColor,
    this.callback,
    this.currentVote,
    this.targetVote,
  });

  @override
  _SubmissionListingActionButtonState createState() =>
      _SubmissionListingActionButtonState();
}

class _SubmissionListingActionButtonState
    extends State<SubmissionListingActionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.iconData),
      onPressed: () {
        if (widget.callback != null) {
          setState(() {
            widget.callback(widget.currentVote == widget.targetVote
                ? VoteState.none
                : widget.targetVote);
          });
        }
      },
      color: _getColor(),
      splashColor:
          (widget.clickedColor ?? Theme.of(context).textTheme.subtitle.color)
              .withOpacity(0.1),
      iconSize:
          widget.iconSize ?? Theme.of(context).textTheme.subtitle.fontSize,
    );
  }

  Color _getColor() {
    return widget.targetVote == widget.currentVote
        ? widget.clickedColor ?? Theme.of(context).textTheme.subtitle.color
        : widget.color ?? Theme.of(context).textTheme.subtitle.color;
  }
}
