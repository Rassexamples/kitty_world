import 'dart:convert';
import 'package:http/http.dart' as net;
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/model/fetch_result.dart';
import 'package:kitty_world/resources/text_resources.dart';

///
/// It contains a single service, fetching and parsing the json.
///
/// It customized jost for the given json structure.
class Service {

  static final Service _service = Service._init();

  factory Service(){
    return _service;
  }
  Service._init();


  Future<FetchResult> getResultByUrl(String url) async {
    net.Response x;
    try {
      x = await _fetch(url);
    } catch (e) {
      return FetchError(TextResource.fetchingError);
    }
    if (x.statusCode == 200) {
      Map<dynamic, dynamic> jsonResult;
      try {
        jsonResult = json.decode(x.body);
      } catch (e) {
        return FetchError("${TextResource.fetchingError} , code: ${x.statusCode}");
      }

      List data = (jsonResult['data']);
      int perPage = (jsonResult['per_page']);
      int lastPage = (jsonResult['last_page']);
      int currentPage = (jsonResult['current_page']);

      List<CatFact> facts = data.map((item) => CatFact.fromJson(item)).toList();
      return FetchContent(facts:facts,perPage: perPage,lastPage:lastPage,currentPage: currentPage);
    } else {
      return FetchError(TextResource.fetchingError);
    }
  }

  Future<net.Response> _fetch(String url){
    return net.get(Uri.parse(url));
  }
}
