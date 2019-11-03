import 'dart:ui';

import 'package:flutter/material.dart';

class BlurPageRoute extends PageRoute<void> {
  final WidgetBuilder builder;

  BlurPageRoute({
    @required this.builder,
    RouteSettings settings,
  })  : assert(builder != null),
        super(settings: settings);

  @override
  Color get barrierColor => null;
  @override
  bool get opaque => false;

  @override
  String get barrierLabel => null;

  @override
  bool get barrierDismissible => true;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 250);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return _BlurPageTransition(
      animation: new Tween<double>(
        begin: 0.0,
        end: 10.0,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}

class _BlurPageTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  _BlurPageTransition({
    this.animation,
    this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: new ImageFilter.blur(
        sigmaX: animation.value,
        sigmaY: animation.value,
      ),
      child: child,
    );
  }
}
