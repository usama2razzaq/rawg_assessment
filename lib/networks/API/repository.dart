import 'package:assignment/networks/API/api_base_helper.dart';
import 'package:assignment/networks/API/exceptions.dart';
import 'package:assignment/networks/data_model/game_details_response.dart';
import 'package:assignment/networks/data_model/games_response.dart';

import '../../api/api_key.dart';

class Repository {
  //Api Helper to method
  ApiBaseHelper helper = ApiBaseHelper();

  Future<GamesResponse> getGames(
      {int? page, int? pageSize, String? startDate, String? endDate}) async {
    try {
      final response = await helper.get(
          'games?key=${rawgApiKey}&page=$page&page_size=$pageSize&ordering=-released&dates=$startDate,$endDate&platforms=187');

      return GamesResponse.fromJson(response);
    } catch (exception) {
      print(exception.toString());
      throw ServerException(message: exception.toString());
    }
  }

//get games details from REST API
  Future<GameDetailsResponse> getGameDetails({int? id}) async {
    try {
      final response = await helper.get('games/$id?key=$rawgApiKey');

      return GameDetailsResponse.fromJson(response);
    } catch (exception) {
      print(exception.toString());

      throw ServerException(message: exception.toString());
    }
  }
}
