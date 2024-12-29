import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Bloc/cubit.dart';
import 'package:myapp/Bloc/states.dart';
import 'package:myapp/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(MoviesInitial()),
      child:const MaterialApp(
        home: MoviesScreen(),
      ),
    );
  }
}
