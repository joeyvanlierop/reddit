import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list.dart';
import 'package:reddit/theme/bloc/bloc.dart';
import 'package:reddit/theme/themes.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.themeData,
            home: TransparentAppBar(
              appBar: AppBar(
                elevation: 0,
                title: InkWell(
                  onLongPress: () => BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(appTheme: _swapTheme(state))),
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
              child: Scaffold(
                body: SubmissionList(
                  subreddit: 'all',
                  limit: 25,
                ),
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

class TransparentAppBar extends StatelessWidget {
  final Widget child;
  final AppBar appBar;

  const TransparentAppBar({
    Key key,
    this.appBar,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (child != null) child,
        if (appBar != null)
          Positioned.fill(
            bottom: null,
            child: ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: PreferredSize(
                  preferredSize: Size.fromHeight(500.0),
                  child: appBar,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
