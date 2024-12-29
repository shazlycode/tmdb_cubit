// Suggested code may be subject to a license. Learn more: ~LicenseLog:505952904.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:164961448.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2283959615.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3829269195.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1918304828.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2173088815.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:580096930.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movie {
  final String title;
  final String posterPath;

  Movie({required this.title, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movie> _movies = [];
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=e106d240d4cee36a80f2ac52d5582a01'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _movies = (jsonData['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
        _isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TMDB Movies')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _movies.length,
              itemBuilder: (context, index) {
                final movie = _movies[index];
                return ListTile(
                  leading: Image.network(
                      'https://image.tmdb.org/t/p/w92${movie.posterPath}'),
                  title: Text(movie.title),
                );
              },
            ),
    );
  }
}
