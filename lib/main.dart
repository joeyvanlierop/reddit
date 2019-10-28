import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list_bloc.dart';
import 'package:reddit/submission_list/submission_list_event.dart';
import 'package:reddit/submission_list/submission_list_view.dart';
import 'package:reddit/themes/theme.dart';

void main() => runApp(App());

List posts = [];

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        /*appBar: AppBar(
          title: Center(
            child: Text(
              "Reddit",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),*/
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 200.0,
              title: Center(
                child: Text(
                  "Reddit",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: BlocProvider(
                builder: (context) =>
                    SubmissionListBloc(subreddit: 'all', limit: 15)
                      ..add(Fetch()),
                child: SubmissionListView(),
              ),
            ),
          ],
        ),
        /*body: BlocProvider(
          builder: (context) =>
              SubmissionListBloc(subreddit: 'all', limit: 15)..add(Fetch()),
          child: SubmissionListView(),
        ),*/
      ),
    );
  }
}
