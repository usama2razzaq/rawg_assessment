import 'package:assignment/user_interface/pages/game_details_page.dart';
import 'package:assignment/user_interface/pages/game_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String navigationContainer = '/';
  static const String gamesPage = '/home_container/games';
  static const String gameDetailsPage = '/home_container/games/game_details';

  static const initialRoute = navigationContainer;

  static final Map<String, WidgetBuilder> routes = {
    gamesPage: (context) => GamesPage(),
    gameDetailsPage: (context) => GameDetailsPage(
        game: ModalRoute.of(context)!.settings.arguments as GamesPage),
  };
}
