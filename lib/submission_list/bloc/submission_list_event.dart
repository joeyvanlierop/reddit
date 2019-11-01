import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SubmissionListEvent extends Equatable {}

class Fetch extends SubmissionListEvent {
  @override
  List<Object> get props => [];
}
