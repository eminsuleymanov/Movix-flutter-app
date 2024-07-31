
class MovieResponse {
    final String id;
    final String title;
    final int year;
    final String rated;
    final DateTime released;
    final int runtime;
    final String type;
    final List<Actor> genres;
    final List<Actor> actors;
    final String director;
    final String plot;
    final List<String> language;
    final String country;
    final String poster;
    final String videoUrl;
    final List<Rating> ratings;
    final String boxOffice;
    final DateTime createdAt;
    final DateTime updatedAt;

    MovieResponse({
        required this.id,
        required this.title,
        required this.year,
        required this.rated,
        required this.released,
        required this.runtime,
        required this.type,
        required this.genres,
        required this.actors,
        required this.director,
        required this.plot,
        required this.language,
        required this.country,
        required this.poster,
        required this.videoUrl,
        required this.ratings,
        required this.boxOffice,
        required this.createdAt,
        required this.updatedAt,
    });

    factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        id: json["_id"],
        title: json["title"],
        year: json["year"],
        rated: json["rated"],
        released: DateTime.parse(json["released"]),
        runtime: json["runtime"],
        type: json["type"],
        genres: List<Actor>.from(json["genres"].map((x) => Actor.fromJson(x))),
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        director: json["director"],
        plot: json["plot"],
        language: List<String>.from(json["language"].map((x) => x)),
        country: json["country"],
        poster: json["poster"],
        videoUrl: json["videoUrl"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        boxOffice: json["boxOffice"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

}

class Actor {
    final String id;
    final String img;
    final String name;
    final List<String> movies;
    final DateTime createdAt;
    final DateTime updatedAt;

    Actor({
        required this.id,
        required this.img,
        required this.name,
        required this.movies,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        movies: List<String>.from(json["movies"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );
}

class Rating {
    final String id;
    final String source;
    final String value;
    final String movie;
    final DateTime createdAt;
    final DateTime updatedAt;

    Rating({
        required this.id,
        required this.source,
        required this.value,
        required this.movie,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["_id"],
        source: json["source"],
        value: json["value"],
        movie: json["movie"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );
}
