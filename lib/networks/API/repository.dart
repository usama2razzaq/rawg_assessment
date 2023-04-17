import 'dart:collection';
import 'package:assignment/networks/API/api_base_helper.dart';
import 'package:assignment/networks/API/exceptions.dart';
import 'package:assignment/networks/data_model/game_details_response.dart';
import 'package:assignment/networks/data_model/games_response.dart';
import 'package:assignment/utils/constants.dart';

class Repository {
  ApiBaseHelper helper = ApiBaseHelper();

  Future<GamesResponse> getGames(
      {int? page, int? pageSize, String? startDate, String? endDate}) async {
    try {
      final response = await helper.get(
          'games?key=${Constants.apiKey}&page=$page&page_size=$pageSize&ordering=-released&dates=$startDate,$endDate&platforms=187');

      return GamesResponse.fromJson(response);
    } catch (exception) {
      print(exception.toString());
      throw ServerException(message: exception.toString());
    }
  }

  Future<GameDetailsResponse> getGameDetails(
      {required int id, required String key}) async {
    try {
      final response = await helper.get('games/$id?key=${Constants.apiKey}');
      return GameDetailsResponse.fromJson(response);
    } catch (exception) {
      print(exception.toString());

      throw ServerException(message: exception.toString());
    }
  }
}
