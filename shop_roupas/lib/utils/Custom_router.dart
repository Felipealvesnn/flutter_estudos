import 'package:flutter/material.dart';

class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (settings.name == '/') {
    //   return child;
    // }
    return FadeTransition(opacity: animation, child: child);
    // return SlideTransition(
    //   position: Tween<Offset>(
    //     begin: const Offset(1.0, 0.0),
    //     end: Offset.zero,
    //   ).animate(animation),
    //   child: child,
    // );
  }
}

//classe pra criar uma transicao

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    // ignore: avoid_unused_constructor_parameters
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {

    // if (route.settings.name == '/') {
    //   return child;
    // }
    return FadeTransition(opacity: animation, child: child);
    // return SlideTransition(
    //   position: Tween<Offset>(
    //     begin: const Offset(1.0, 0.0),
    //     end: Offset.zero,
    //   ).animate(animation),
    //   child: child,
    // );
  }
  
}