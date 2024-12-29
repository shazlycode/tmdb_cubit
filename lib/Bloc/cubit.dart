import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Bloc/model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Bloc/states.dart';
import 'package:myapp/constants/constants.dart';

class MoviesCubit extends Cubit {
  MoviesCubit(super.initialState);

  List<Movie> movies = [];

  Future fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['results'];
        List fetched = [];
        fetched = data.map((e) => [e]).toList();
        
        // for (int i = 0; i < data.length; i++) {
        //   fetched = data.map((e) => Movie.fromJson(e)).toList();
        // }
        // movies = fetched;
        emit(MoviesChangeState());
        return fetched;
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
