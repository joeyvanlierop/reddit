import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list_view.dart';

import 'bloc/bloc.dart';

class SubmissionList extends StatelessWidget {
  final String subreddit;
  final int limit;

  const SubmissionList({
    Key key,
    @required this.subreddit,
    this.limit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => SubmissionListBloc(
        subreddit: this.subreddit,
        limit: this.limit ?? 25,
      )..add(Fetch()),
      child: SubmissionListView(),
    );
  }
}
