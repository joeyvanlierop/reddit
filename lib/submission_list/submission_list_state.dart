import 'package:draw/draw.dart';

abstract class SubmissionListState {
  const SubmissionListState();
}

class ListUninitialized extends SubmissionListState {}

class ListError extends SubmissionListState {}

class ListLoaded extends SubmissionListState {
  final List<Submission> submissions;
  final bool outOfSubmissions;

  const ListLoaded({
    this.submissions,
    this.outOfSubmissions,
  });

  ListLoaded copyWith({
    List<Submission> submissions,
    bool outOfSubmissions,
  }) {
    return ListLoaded(
      submissions: submissions ?? this.submissions,
      outOfSubmissions: outOfSubmissions ?? this.outOfSubmissions,
    );
  }
}
