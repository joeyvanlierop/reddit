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
  final List<Submission> submissions;
  final bool outOfSubmissions;

  const ListLoaded({
    this.submissions,
    this.outOfSubmissions,
  });

  @override
  List<Object> get props => [
        submissions,
        outOfSubmissions,
      ];

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
