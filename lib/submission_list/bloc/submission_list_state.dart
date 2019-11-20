import 'package:draw/draw.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubmissionListState extends Equatable {
  const SubmissionListState();

  @override
  List<Object> get props => [];
}

class ListUninitialized extends SubmissionListState {}

class ListError extends SubmissionListState {}

class ListLoaded extends SubmissionListState {
  final List<Submission> submissionList;
  final bool outOfSubmissions;

  const ListLoaded({
    this.submissionList,
    this.outOfSubmissions,
  });

  @override
  List<Object> get props => [
        submissionList,
        outOfSubmissions,
      ];

  ListLoaded copyWith({
    List<Submission> submissionList,
    bool outOfSubmissions,
  }) {
    return ListLoaded(
      submissionList: submissionList ?? this.submissionList,
      outOfSubmissions: outOfSubmissions ?? this.outOfSubmissions,
    );
  }
}
