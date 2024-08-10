class MovieResponse {
  final String id;
  final String title;
  final int year;
  final String rated;
  final DateTime released;
  final int runtime;
  final String type;
  final List<Genre> genres;
  final List<Actor> actors;
  final String director;
  final String plot;
  final List<String> language;
  final String country;
  final String poster;
  final String videoUrl;
  final List<Rating> ratings;
  final String boxOffice;

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
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      year: json['year'] ?? 0,
      rated: json['rated'] ?? '',
      released: json['released'] != null ? DateTime.parse(json['released']) : DateTime.now(),
      runtime: json['runtime'] ?? 0,
      type: json['type'] ?? '',
      genres: json['genres'] != null
          ? (json['genres'] as List).map((e) => Genre.fromJson(e)).toList()
          : [],
      actors: json['actors'] != null
          ? (json['actors'] as List).map((e) => Actor.fromJson(e)).toList()
          : [],
      director: json['director'] ?? '',
      plot: json['plot'] ?? '',
      language: json['language'] != null ? List<String>.from(json['language']) : [],
      country: json['country'] ?? '',
      poster: json['poster'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      ratings: json['ratings'] != null
          ? (json['ratings'] as List).map((e) => Rating.fromJson(e)).toList()
          : [],
      boxOffice: json['boxOffice'] ?? '',
    );
  }

  
}

class Genre {
  final String id;
  final String name;
  final List<String> movies;

  Genre({
    required this.id,
    required this.name,
    required this.movies,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      movies: json['movies'] != null ? List<String>.from(json['movies']) : [],
    );
  }

  
}

class Actor {
  final String id;
  final String img;
  final String name;
  final List<String> movies;

  Actor({
    required this.id,
    required this.img,
    required this.name,
    required this.movies,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['_id'] ?? '',
      img: json['img'] ?? '',
      name: json['name'] ?? '',
      movies: json['movies'] != null ? List<String>.from(json['movies']) : [],
    );
  }

  
}

class Rating {
  final String id;
  final String source;
  final String value;

  Rating({
    required this.id,
    required this.source,
    required this.value,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['_id'] ?? '',
      source: json['source'] ?? '',
      value: json['value'] ?? '',
    );
  }

  
}
