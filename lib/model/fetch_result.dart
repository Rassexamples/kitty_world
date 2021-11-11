
import 'package:kitty_world/model/cat_fact.dart';



///A wrapper to all the possible states of the application regarding the results
abstract class FetchResult {}

class FetchContent extends FetchResult {
  List<CatFact> facts = [];
  int perPage = 0;
  int lastPage=0;
  int currentPage;
  FetchContent({required this.facts,required this.perPage, required  this.lastPage,required this.currentPage});
}

class FetchError extends FetchResult {
  final String error;

  FetchError(this.error);
}

class Fetching extends FetchResult {}

//
