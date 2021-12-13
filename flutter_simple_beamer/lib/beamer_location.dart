import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_beamer/view_home.dart';

class BeamerLocation extends BeamLocation<BeamState> {
  BeamerLocation(RouteInformation routeInformation) : super(routeInformation);
  @override
  List<String> get pathPatterns => [
        '/',
        '/:menuIndex',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey('home-${state.uri}'),
          title: 'Home',
          child: ViewHome(
            menuIndex: (context.currentBeamLocation.state as BeamState)
                    .pathParameters['menuIndex'] ??
                '',
          ),
        ),
        // if (state.pathParameters.containsKey('menuIndex'))
        //   BeamPage(
        //     key: ValueKey('book-${state.pathParameters['menuIndex']}'),
        //     title: 'title',
        //     child: ViewContent(
        //       menuIndex: (context.currentBeamLocation.state as BeamState)
        //               .pathParameters['menuIndex'] ??
        //           '',
        //     ),
        //   ),
      ];
}
