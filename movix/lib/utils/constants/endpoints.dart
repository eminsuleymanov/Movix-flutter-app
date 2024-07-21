
class Endpoints {
  Endpoints._();

  static const _baseUrl = "http://localhost:7070/api";
  //Categories
  static const categories = "$_baseUrl/genres";
  static const categoryById = "$_baseUrl/genres/:id";

  //Movies
  static const movies = "$_baseUrl/movies";
  static const movieById = "$_baseUrl/movies/:id";
  static const movieByGenre = "$_baseUrl/movies/genre/:genreId";
}