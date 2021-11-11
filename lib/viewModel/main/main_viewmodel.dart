import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kitty_world/data/repo.dart';
import 'package:kitty_world/model/cat_fact.dart';
import 'package:kitty_world/model/fetch_result.dart';
import 'package:kitty_world/resources/link_resources.dart';
import 'package:kitty_world/ui/shared_elements/router.dart';
import 'package:kitty_world/util/extensions.dart';


class MainViewModel extends ChangeNotifier {

  static final MainViewModel _mainViewModel = MainViewModel._init();

  factory MainViewModel(){
    return _mainViewModel;
  }
  MainViewModel._init();

  Repository repo = Repository();
  FetchResult latestResult = Fetching();


  final List<int> _picNum = [];

  //Helper function to ensure photos' url stays unique, though apparently the website is messing with me
  String getRandomImageUrl(int index) {
    var uniqueRand = _getUniqueRandomInt();
    _picNum.add(uniqueRand);
    if (_picNum.isNotEmpty) {
      return "${LinkResources.baseUrlForImages}${_picNum[index]}/${_picNum[index]}?image";
    }
    return " ";
  }
  int _getUniqueRandomInt() {
    var x = RandomInRange.randomInRange(100, 999);
    if (_picNum.contains(x)) {
      _getUniqueRandomInt();
    }
    return x;
  }

  ///
  /// It get the updated list of facts from [Repository]
  /// add the to the fact
  ///
  Future getContent() async {
    FetchResult result = await repo.getMoreFacts()
        .catchError((e,s){return FetchError("error");});
    latestResult = result;
    notifyListeners();
  }

  ///
  /// Getting the [context], it pushes the [DetailsView] of the given [fact]  to the stack
  onItemTap(BuildContext context, CatFact fact, int indexOnList) {
    fact.positionOnList = indexOnList;
    Navigator.pushNamed(context, KittyAppRoutes.DETAIL_SCREEN, arguments: fact);
  }
}
