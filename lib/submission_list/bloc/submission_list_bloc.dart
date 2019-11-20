import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:draw/draw.dart';
import 'package:flutter/foundation.dart';
import 'package:reddit/accounts/account.dart';
import 'package:reddit/accounts/account_manager.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';

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
      (events as Observable<SubmissionListEvent>).throttleTime(
        Duration(seconds: 1),
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
      print('Received fetch...');
      if (!_outOfSubmissions(currentState)) {
        print('Fetching posts...');

        if (currentState is ListUninitialized) {
          final List<Submission> submissionList = await _fetchSubmissions();

          yield ListLoaded(
            submissionList: submissionList,
            outOfSubmissions: false,
          );
        } else if (currentState is ListLoaded) {
          final List<Submission> submissionList = await _fetchSubmissions(
            after: currentState.submissionList.last.fullname,
          );

          yield submissionList.isEmpty
              ? currentState.copyWith(
                  outOfSubmissions: true,
                )
              : ListLoaded(
                  submissionList: currentState.submissionList + submissionList,
                  outOfSubmissions: false,
                );
          print(currentState.submissionList.length);
        }
      }
    }
  }

  bool _outOfSubmissions(SubmissionListState state) {
    return state is ListLoaded && state.outOfSubmissions;
  }

  Future<List<Submission>> _fetchSubmissions({String after}) async {
    final Account account = await AccountManager.getInstance().currentAccount();
    final Stream<UserContent> submissionsStream =
        account.reddit.subreddit(subreddit).hot(
              limit: limit,
              after: after,
            );
    final List<Submission> submissionList =
        await submissionsStream.cast<Submission>().toList();

    return submissionList;
  }
}
