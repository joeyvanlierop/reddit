import 'package:bloc/bloc.dart';
import 'package:draw/draw.dart';
import 'package:flutter/material.dart';
import 'package:reddit/accounts/account_manager.dart';
import 'package:rxdart/rxdart.dart';

import 'submission_list_bloc.dart';
import 'submission_list_event.dart';
import 'submission_list_state.dart';

export 'submission_list_bloc.dart';
export 'submission_list_event.dart';
export 'submission_list_state.dart';
export 'submission_list_view.dart';

class SubmissionListBloc
    extends Bloc<SubmissionListEvent, SubmissionListState> {
  String subreddit;
  int limit;

  SubmissionListBloc({
    @required this.subreddit,
    @required this.limit,
  });

  @override
  Stream<SubmissionListState> transformEvents(
    Stream<SubmissionListEvent> events,
    Stream<SubmissionListState> Function(SubmissionListEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<SubmissionListEvent>).debounceTime(
        Duration(milliseconds: 250),
      ),
      next,
    );
  }

  @override
  SubmissionListState get initialState => ListUninitialized();

  @override
  Stream<SubmissionListState> mapEventToState(
      SubmissionListEvent event) async* {
    final currentState = state;

    if (event is Fetch) {
      if (!_outOfSubmissions(currentState)) {
        if (currentState is ListUninitialized) {
          final List<Submission> submissions = await _fetchSubmissions();
          yield ListLoaded(
            submissions: submissions,
            outOfSubmissions: false,
          );
        } else if (currentState is ListLoaded) {
          final List<Submission> submissions = await _fetchSubmissions(
            after: currentState.submissions.last.fullname,
          );
          print('Fetched posts...');
          yield submissions.isEmpty
              ? currentState.copyWith(
                  outOfSubmissions: true,
                )
              : ListLoaded(
                  submissions: currentState.submissions + submissions,
                  outOfSubmissions: false,
                );
        }
      }
    }
  }

  bool _outOfSubmissions(SubmissionListState state) {
    return state is ListLoaded && state.outOfSubmissions;
  }

  Future<List<Submission>> _fetchSubmissions({String after}) async {
    return await AccountManager.getInstance()
        .currentAccount()
        .then((account) => account.reddit
            .subreddit(this.subreddit)
            .hot(
              after: after,
              limit: limit,
            )
            .toList()
            .then((submissions) => submissions.cast<Submission>()))
        .catchError((error) => Future.error(error));
  }
}
