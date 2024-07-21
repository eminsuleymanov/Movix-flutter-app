class CategoryResponse {
  final String id;
  final String name;
  final List<dynamic> movies;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryResponse({
    required this.id,
    required this.name,
    required this.movies,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        id: json["_id"],
        name: json["name"],
        movies: List<dynamic>.from(json["movies"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "movies": List<dynamic>.from(movies.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
