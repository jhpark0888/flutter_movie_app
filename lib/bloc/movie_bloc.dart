import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/model/item_model.dart';
import 'package:flutter_bloc_movies/repository/pop_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc extends BlocBase {
  final PopularRepository _popularRepository = PopularRepository();

  final PublishSubject<ItemModel> _moviesSubject = PublishSubject<ItemModel>();
  Stream<ItemModel> get movies => _moviesSubject.stream;

  Future<void> fetchMovies() async {
    ItemModel itemModel = await _popularRepository.loadPopMovies();
    _moviesSubject.sink.add(itemModel);
  }

  @override
  dispose() {
    _moviesSubject.close();
  }
}
