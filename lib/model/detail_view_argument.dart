import 'package:kitty_world/model/cat_fact.dart';

class DetailViewArgument{
  final CatFact fact;
  final String imageUrl;
 final int positionOnList;


  DetailViewArgument(this.fact, this.imageUrl, this.positionOnList);
}