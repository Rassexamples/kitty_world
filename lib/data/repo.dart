import 'dart:async';

import 'package:kitty_world/data/service.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/model/fetch_result.dart';
import 'package:kitty_world/resources/link_resources.dart';

///
/// It works as a in-memory db for the application
class Repository {

  static final Repository _repository = Repository._init();

  factory Repository(){
    return _repository;
  }
  Repository._init();

  Service service = Service();

  List<CatFact> facts = [];
  int nextPageToFetch = 1;

  Future<FetchResult> getMoreFacts() async {
    FetchResult result = await service
        .getResultByUrl("${LinkResources.baseUrlForFacts}$nextPageToFetch")
        .catchError((e,s){return FetchError("error");});
    if(result is FetchContent){
      nextPageToFetch = result.currentPage+1;
        facts.addAll(result.facts);
      return FetchContent(facts: facts,perPage: result.perPage,lastPage: result.lastPage,currentPage:result.currentPage);
    }
    return result;
  }
}

