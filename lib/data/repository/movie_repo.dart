
import 'package:flutter_movie_db/data/model/item_model.dart';
import 'package:flutter_movie_db/utils/config.dart';
import 'package:injectable/injectable.dart';

import 'i_movie_repository.dart';

@injectable
class MovieRepository implements IMovieRepository{

  int getA() {
    return 5;
  }
}