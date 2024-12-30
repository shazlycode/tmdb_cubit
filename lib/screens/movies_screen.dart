import 'package:flutter/material.dart';
import 'package:myapp/Bloc/cubit.dart';

import 'package:myapp/constants/constants.dart';
import 'package:myapp/screens/movie_details_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = MoviesCubit.get(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movies"),
        ),
        body: FutureBuilder(
            future: cubit.fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: cubit.movies.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                      movie: cubit.movies[index])));
                        },
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                "$baseImageUrl$smallSize${cubit.movies[index].poster_path}"),
                          ),
                          title: Text(cubit.movies[index].title!),
                          subtitle: Text(
                              "Vote: ${cubit.movies[index].vote_average!.toStringAsFixed(2)}"),
                        ),
                      );
                    });
              }
            }));
  }
}
