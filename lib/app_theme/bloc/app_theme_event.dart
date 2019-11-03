import 'package:equatable/equatable.dart';
import 'package:reddit/app_theme/app_themes.dart';

abstract class AppThemeEvent extends Equatable {
  const AppThemeEvent();

  @override
  List<Object> get props => null;
}

class SetAppThemeEvent extends AppThemeEvent {
  final AppTheme appTheme;

  SetAppThemeEvent({this.appTheme});

  @override
  List<Object> get props => [this.appTheme];
}

class SwapAppThemeEvent extends AppThemeEvent {}
