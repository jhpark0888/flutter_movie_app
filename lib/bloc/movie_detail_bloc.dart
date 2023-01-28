import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/model/movie.dart';
import 'package:flutter_bloc_movies/repository/detail_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc extends BlocBase {
  final DetailRepository _detailRepository = DetailRepository();

  final PublishSubject<Movie> _movieDetailSubject = PublishSubject<Movie>();
  Stream<Movie> get movie => _movieDetailSubject.stream;

  Future<void> fetchMovie(int id) async {
    Movie movieItem = await _detailRepository.loadMovie(id);
    _movieDetailSubject.sink.add(movieItem);
  }

  @override
  dispose() {
    _movieDetailSubject.close();
  }
}
