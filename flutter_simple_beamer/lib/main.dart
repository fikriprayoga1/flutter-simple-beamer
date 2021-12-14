import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_beamer/beamer_location.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Simple Beamer',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        transitionDelegate: const NoAnimationTransitionDelegate(),
        locationBuilder: (routeInformation, _) =>
            BeamerLocation(routeInformation),
      ),
    );
  }
}
