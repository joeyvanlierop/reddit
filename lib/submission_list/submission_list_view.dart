import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit/submission_list/submission_list_bloc.dart';
import 'package:reddit/submission_list/submission_list_state.dart';
import 'package:reddit/submission_listing/layouts/submission_listing_compact.dart';

class SubmissionListView extends StatefulWidget {
  @override
  _SubmissionListViewState createState() => _SubmissionListViewState();
}

class _SubmissionListViewState extends State<SubmissionListView> {
  final ScrollController _scrollController = ScrollController();
  final double _scrollThreshold = 5000.0;
  SubmissionListBloc _listBloc;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    _listBloc = BlocProvider.of<SubmissionListBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmissionListBloc, SubmissionListState>(
      builder: (context, state) {
        if (state is ListError) {
          return Center(
            child: Text('Retry'),
          );
        } else if (state is ListUninitialized) {
          return Center(
            child: LoadingIndicator(),
          );
        } else if (state is ListLoaded) {
          return ListView.separated(
            padding: EdgeInsets.all(0.0),
            cacheExtent: 3000.0,
            controller: _scrollController,
            itemCount: state.outOfSubmissions
                ? state.submissions.length
                : state.submissions.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index >= state.submissions.length
                  ? LoadingIndicator()
                  : SubmissionListingCompact(
                      submission: state.submissions[index],
                      spacing: 4.0,
                    );
            },
            separatorBuilder: (context, index) {
              return ListSeparator(
                thickness: 0.75,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              );
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
              );
            },
          );
        } else {
          return null;
        }
      },
    );
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      _listBloc.add(Fetch());
    }
  }
}

class ListSeparator extends StatelessWidget {
  final Color color;
  final double thickness;
  final EdgeInsets padding;

  const ListSeparator({
    Key key,
    this.color,
    this.thickness,
    this.padding,
  })  : assert(thickness >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding ?? EdgeInsets.all(0.0),
      child: SizedBox(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: this.color ?? Theme.of(context).dividerColor,
                  width: this.thickness ?? 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}
