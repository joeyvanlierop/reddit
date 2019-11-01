import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list.dart';
import 'package:reddit/theme/bloc/bloc.dart';
import 'package:reddit/theme/themes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            home: Scaffold(
              appBar: AppBar(
                title: InkWell(
                  onLongPress: () => BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(appTheme: _swapTheme(state))),
                  child: Center(
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              body: SubmissionList(
                subreddit: 'all',
                limit: 25,
              ),
            ),
          );
        },
      ),
    );
  }

  AppTheme _swapTheme(ThemeState state) {
    return state.themeData == appThemeData[AppTheme.darkTheme]
        ? AppTheme.lightTheme
        : AppTheme.darkTheme;
  }
}
