import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list_bloc.dart';
import 'package:reddit/submission_list/submission_list_event.dart';
import 'package:reddit/themes/theme.dart';

void main() => runApp(App());

List posts = [];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Test',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: BlocProvider(
          builder: (context) =>
              SubmissionListBloc(subreddit: 'popular', limit: 25)..add(Fetch()),
          child: SubmissionListView(),
        ),
      ),
    );
  }
}
