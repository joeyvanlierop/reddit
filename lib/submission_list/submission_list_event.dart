abstract class SubmissionListEvent {}

class Search extends SubmissionListEvent {
  String query;
}

class Fetch extends SubmissionListEvent {}
