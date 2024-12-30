import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Bloc/model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Bloc/states.dart';
import 'package:myapp/constants/constants.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesInitial());

  static MoviesCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<Movie> movies = [];

  Future fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'] as List;
        List<Movie> fetched = [];
        // return data
        //     .map((e) => Movie(
        //         id: e['id'].toString(),
        //         adult: e['adult'],
        //         backdrop_path: e['backdrop_path'],
        //         genre_ids: List<int>.from(e['genre_ids']),
        //         popularity: e['popularity'].toString(),
        //         original_language: e['original_language'],
        //         original_title: e['original_title'],
        //         overview: e['overview'],
        //         poster_path: e['poster_path'],
        //         release_date: e['release_date'],
        //         title: e['title'],
        //         video: e['video'],
        //         vote_average: e['vote_average'].toString(),
        //         vote_count: e['vote_count'].toString()))
        //     .toList();
        // var news = data.map((e) => Movie.fromJson(e));
        // print(data);
        for (int i = 0; i < data.length; i++) {
          fetched.add(Movie(
              id: data[i]['id'].toString(),
              adult: data[i]['adult'],
              backdrop_path: data[i]['backdrop_path'],
              genre_ids: List<int>.from(data[i]['genre_ids']),
              popularity: data[i]['popularity'].toString(),
              original_language: data[i]['original_language'],
              original_title: data[i]['original_title'],
              overview: data[i]['overview'],
              poster_path: data[i]['poster_path'],
              release_date: data[i]['release_date'],
              title: data[i]['title'],
              video: data[i]['video'],
              vote_average: data[i]['vote_average'],
              vote_count: data[i]['vote_count'].toString()));
        }
        movies = fetched;
        emit(MoviesChangeState());
        // return fetched;
      } else {
        print(response.statusCode);
        throw Exception('Failed to load movies');
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
