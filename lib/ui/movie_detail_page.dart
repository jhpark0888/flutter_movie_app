import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/bloc/movie_detail_bloc.dart';
import 'package:flutter_bloc_movies/model/movie.dart';

import 'components/appbar.dart';

class MovieDetailPage extends StatelessWidget {
  MovieDetailPage({Key? key, required this.movie}) : super(key: key);
  Movie movie;

  @override
  Widget build(BuildContext context) {
    final MovieDetailBloc _movieDetailBloc = MovieDetailBloc();
    return Scaffold(
      appBar: CustomAppBar(title: "영화 소개"),
      body: BlocProvider<MovieDetailBloc>(
        blocBuilder: () {
          _movieDetailBloc.fetchMovie(movie.id!);
          return _movieDetailBloc;
        },
        child: StreamBuilder(
            stream: _movieDetailBloc.movie,
            builder: (context, AsyncSnapshot<Movie> snapshot) {
              if (snapshot.hasData) {
                Movie movie = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(children: [
                    Image.network(
                      movie.posterUrl,
                      fit: BoxFit.contain,
                    )
                  ]),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
