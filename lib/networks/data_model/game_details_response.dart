import 'dart:convert';

class GameDetailsResponse {
  GameDetailsResponse({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.genres,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  int? metacritic;
  List<MetacriticPlatform>? metacriticPlatforms;
  String? released;
  bool? tba;
  String? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  Reactions? reactions;
  int? added;
  AddedByStatus? addedByStatus;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? creatorsCount;
  int? achievementsCount;
  int? parentAchievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  int? redditCount;
  int? twitchCount;
  int? youtubeCount;
  int? reviewsTextCount;
  int? ratingsCount;
  int? suggestionsCount;
  List<dynamic>? alternativeNames;
  String? metacriticUrl;
  int? parentsCount;
  int? additionsCount;
  int? gameSeriesCount;
  dynamic userGame;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<ParentPlatform>? parentPlatforms;
  List<PlatformElement>? platforms;
  List<Genres>? genres;
  List<Developer>? publishers;
  dynamic esrbRating;
  dynamic clip;
  String? descriptionRaw;

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GameDetailsResponse(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms: json["metacritic_platforms"] == null
            ? []
            : List<MetacriticPlatform>.from(json["metacritic_platforms"]!
                .map((x) => MetacriticPlatform.fromJson(x))),
        released: json["released"] == null ? null : json["released"],
        tba: json["tba"],
        updated: json["updated"] == null ? null : json["updated"],
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        reactions: json["reactions"] == null
            ? null
            : Reactions.fromJson(json["reactions"]),
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromJson(json["added_by_status"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        alternativeNames: json["alternative_names"] == null
            ? []
            : List<dynamic>.from(json["alternative_names"]!.map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        genres:
            List<Genres>.from(json["genres"].map((x) => Genres.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<ParentPlatform>.from(json["parent_platforms"]!
                .map((x) => ParentPlatform.fromJson(x))),
        platforms: json["platforms"] == null
            ? []
            : List<PlatformElement>.from(
                json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
        esrbRating: json["esrb_rating"],
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
      );
}

class AddedByStatus {
  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  int? yet;
  int? owned;
  int? beaten;
  int? toplay;
  int? dropped;
  int? playing;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
      };
}

class Genres {
  Genres({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );
}

class Developer {
  Developer({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  String? domain;
  String? language;

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: json["language"]!,
      );
}

class MetacriticPlatform {
  MetacriticPlatform({
    this.metascore,
    this.url,
    this.platform,
  });

  int? metascore;
  String? url;
  MetacriticPlatformPlatform? platform;

  factory MetacriticPlatform.fromJson(Map<String, dynamic> json) =>
      MetacriticPlatform(
        metascore: json["metascore"],
        url: json["url"],
        platform: json["platform"] == null
            ? null
            : MetacriticPlatformPlatform.fromJson(json["platform"]),
      );
}

class MetacriticPlatformPlatform {
  MetacriticPlatformPlatform({
    this.platform,
    this.name,
    this.slug,
  });

  int? platform;
  String? name;
  String? slug;

  factory MetacriticPlatformPlatform.fromJson(Map<String, dynamic> json) =>
      MetacriticPlatformPlatform(
        platform: json["platform"],
        name: json["name"],
        slug: json["slug"],
      );
}

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  ParentPlatformPlatform? platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] == null
            ? null
            : ParentPlatformPlatform.fromJson(json["platform"]),
      );
}

class ParentPlatformPlatform {
  ParentPlatformPlatform({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory ParentPlatformPlatform.fromJson(Map<String, dynamic> json) =>
      ParentPlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );
}

class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });

  PlatformPlatform? platform;
  String? releasedAt;
  Requirements? requirements;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: json["platform"] == null
            ? null
            : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null ? null : json["released_at"],
        requirements: json["requirements"] == null
            ? null
            : Requirements.fromJson(json["requirements"]),
      );
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  dynamic image;
  dynamic yearEnd;
  int? yearStart;
  int? gamesCount;
  String? imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );
}

class Requirements {
  Requirements({
    this.minimum,
    this.recommended,
  });

  String? minimum;
  String? recommended;

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
      };
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
        title: json["title"],
        count: json["count"],
        percent: json["percent"]?.toDouble(),
      );
}

class Reactions {
  Reactions();

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions();
}

class Store {
  Store({
    this.id,
    this.url,
    this.store,
  });

  int? id;
  String? url;
  Developer? store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        url: json["url"],
        store: json["store"] == null ? null : Developer.fromJson(json["store"]),
      );
}
