import 'dart:convert';

import 'package:flutter_bloc_movies/model/environment.dart';
import 'package:flutter_bloc_movies/model/item_model.dart';
import 'package:http/http.dart' as http;

class PopularRepository {
  var queryParm = {"api_key": Environment.apikey};

  PopularRepository();

  Future<ItemModel> loadPopMovies() async {
    var uri = Uri.https("api.themoviedb.org", "/3/movie/popular", queryParm);
    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      return ItemModel.fromJson(body);
    } else {
      throw Exception("Failed to load post");
    }
  }
}
