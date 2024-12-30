import 'package:flutter/material.dart';
import 'package:myapp/constants/constants.dart';

import '../Bloc/model.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, this.movie});
  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 200,
              background: Hero(
                  tag: movie!.id!,
                  child: GridTile(
                    footer: Text(
                      movie!.original_title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          backgroundColor: Colors.black54,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    child: Image.network(
                      "$baseImageUrl$bigSize${movie!.poster_path!}",
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            title: Text(movie!.original_title!),
            expandedHeight: 200,
            pinned: true,
          ),
          SliverList.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Text("data${[index]}");
              })
        ],
      ),
    );
  }
}
