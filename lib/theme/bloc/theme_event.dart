import 'package:equatable/equatable.dart';
import 'package:reddit/theme/themes.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme appTheme;

  ThemeChanged({this.appTheme});

  @override
  List<Object> get props => [this.appTheme];
}
