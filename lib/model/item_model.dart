import 'package:flutter_bloc_movies/model/movie.dart';

class ItemModel {
  ItemModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie?>? results;
  int? totalPages;
  int? totalResults;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Movie?>.from(json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x!.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
