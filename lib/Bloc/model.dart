class Movie {
  final String? id;
  final bool? adult;
  final String? backdrop_path;
  final List? genre_ids;
  final String? popularity;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final String? poster_path;
  final String? release_date;
  final String? title;
  final bool? video;
  final String? vote_average;
  final String? vote_count;

  Movie(
      {required this.id,
      required this.adult,
      required this.backdrop_path,
      required this.genre_ids,
      required this.popularity,
      required this.original_language,
      required this.original_title,
      required this.overview,
      required this.poster_path,
      required this.release_date,
      required this.title,
      required this.video,
      required this.vote_average,
      required this.vote_count});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'].toString(),
      adult: json['adult'],
      backdrop_path: json['backdrop_path'].toString(),
      genre_ids: json['genre_ids'].toList(),
      popularity: json['popularity'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'].toString(),
      vote_count: json['vote_count'].toString(),
    );
  }
}
