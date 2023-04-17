// To parse this JSON data, do
//
//     final gameDetailsResponse = gameDetailsResponseFromJson(jsonString);

import 'dart:convert';

class GameDetailsResponse {
  GameDetailsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.userPlatforms,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;
  bool? userPlatforms;

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GameDetailsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        userPlatforms: json["user_platforms"],
      );
}

class Result {
  Result({
    this.slug,
    this.name,
    this.playtime,
    this.platforms,
    this.stores,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.suggestionsCount,
    this.updated,
    this.id,
    this.score,
    this.clip,
    this.tags,
    this.esrbRating,
    this.userGame,
    this.reviewsCount,
    this.communityRating,
    this.saturatedColor,
    this.dominantColor,
    this.shortScreenshots,
    this.parentPlatforms,
    this.genres,
  });

  String? slug;
  String? name;
  int? playtime;
  List<Platform>? platforms;
  List<Store>? stores;
  DateTime? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? suggestionsCount;
  DateTime? updated;
  int? id;
  dynamic score;
  dynamic clip;
  List<Tag>? tags;
  EsrbRating? esrbRating;
  dynamic userGame;
  int? reviewsCount;
  int? communityRating;
  String? saturatedColor;
  String? dominantColor;
  List<ShortScreenshot>? shortScreenshots;
  List<Platform>? parentPlatforms;
  List<Genre>? genres;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: json["platforms"] == null
            ? []
            : List<Platform>.from(
                json["platforms"]!.map((x) => Platform.fromJson(x))),
        stores: json["stores"] == null
            ? []
            : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        id: json["id"],
        score: json["score"],
        clip: json["clip"],
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRating.fromJson(json["esrb_rating"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        communityRating: json["community_rating"],
        saturatedColor: json["saturated_color"]!,
        dominantColor: json["dominant_color"]!,
        shortScreenshots: json["short_screenshots"] == null
            ? []
            : List<ShortScreenshot>.from(json["short_screenshots"]!
                .map((x) => ShortScreenshot.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<Platform>.from(
                json["parent_platforms"]!.map((x) => Platform.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );
}

class AddedByStatus {
  AddedByStatus({
    this.toplay,
    this.yet,
    this.owned,
    this.dropped,
    this.playing,
    this.beaten,
  });

  int? toplay;
  int? yet;
  int? owned;
  int? dropped;
  int? playing;
  int? beaten;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        toplay: json["toplay"],
        yet: json["yet"],
        owned: json["owned"],
        dropped: json["dropped"],
        playing: json["playing"],
        beaten: json["beaten"],
      );
}

class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
    this.nameEn,
    this.nameRu,
  });

  int? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
      );
}

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );
}

class Platform {
  Platform({
    this.platform,
  });

  Genre? platform;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        platform:
            json["platform"] == null ? null : Genre.fromJson(json["platform"]),
      );
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int? id;
  String? title;
  int? count;
  double? percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"]!,
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );
}

class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  Store({
    this.store,
  });

  Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        store: json["store"] == null ? null : Genre.fromJson(json["store"]),
      );
}

class Tag {
  Tag({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  String? language;
  int? gamesCount;
  String? imageBackground;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        language: json["language"]!,
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );
}
