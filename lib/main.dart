import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/app_theme/app_themes.dart';
import 'package:reddit/status_bar_style/status_bar_style.dart';
import 'package:reddit/submission_list/submission_list.dart';

import 'app_theme/bloc/bloc.dart';
import 'status_bar_style/bloc/bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StatusBarStyleBloc>(
          builder: (BuildContext context) => StatusBarStyleBloc()
            ..add(
              SetStatusBarStyleEvent(
                statusBarStyle: StatusBarStyle.transparent,
              ),
            ),
        ),
        BlocProvider<AppThemeBloc>(
          builder: (BuildContext context) => AppThemeBloc()
            ..add(SetAppThemeEvent(appTheme: AppTheme.darkTheme)),
        ),
      ],
      child: BlocListener<StatusBarStyleBloc, StatusBarStyleState>(
        listener: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            state.systemUiOverlayStyle,
          );
        },
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            return MaterialApp(
              theme: state.themeData,
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onLongPress: () =>
              BlocProvider.of<AppThemeBloc>(context).add(SwapAppThemeEvent()),
          child: Center(
            child: Text(
              'Demo',
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
    );
  }
}
