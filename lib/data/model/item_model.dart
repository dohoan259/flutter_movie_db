import 'package:flutter_movie_db/data/repository/remote/model/response/general_movie.dart';

class ItemModel {
  late int _page;
  late int _total_results;
  late int _total_pages;
  List<GeneralMovie> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<GeneralMovie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      GeneralMovie result = GeneralMovie(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<GeneralMovie> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}
