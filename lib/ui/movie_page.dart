import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/bloc/movie_bloc.dart';
import 'package:flutter_bloc_movies/model/item_model.dart';
import 'package:flutter_bloc_movies/model/movie.dart';
import 'package:flutter_bloc_movies/ui/movie_detail_page.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieBloc _movieBloc = MovieBloc();
    return BlocProvider<MovieBloc>(
      blocBuilder: () {
        _movieBloc.fetchMovies();
        return _movieBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movie Page"),
        ),
        body: StreamBuilder(
          stream: _movieBloc.movies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              ItemModel itemModel = snapshot.data!;

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: itemModel.results!.length,
                  itemBuilder: (context, index) {
                    Movie movie = itemModel.results![index]!;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(movie: movie)));
                      },
                      child: Image.network(
                        movie.posterUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  });
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
