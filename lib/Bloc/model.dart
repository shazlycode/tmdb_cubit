class Movie {
  final int? id;
  final bool? adult;
  final int? backdrop_path;
  final List? genre_ids;
  final double? popularity;
  final String? original_language;
  final String? original_title;
  final String? overview;
  final String? poster_path;
  final String? release_date;
  final String? title;
  final bool? video;
  final double? vote_average;
  final int? vote_count;

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
      id: int.tryParse(json['id'].toString()),
      adult: json['adult'],
      backdrop_path: int.tryParse(json['backdrop_path']),
      genre_ids: json['genre_ids'].toList(),
      popularity: json['popularity'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: int.tryParse(json['vote_count']),
    );
  }
}
