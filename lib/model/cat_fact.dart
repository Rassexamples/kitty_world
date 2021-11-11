import 'package:json_annotation/json_annotation.dart';
part 'cat_fact.g.dart';
@JsonSerializable()
class CatFact {
 final String fact;
 final int length;
 final String imageUrl ;
  CatFact({required this.fact, required this.length, required this.imageUrl});

  factory CatFact.fromJson(Map<String,dynamic> json) => _$CatFactFromJson(json);
  Map<String,dynamic> toJson(CatFact catFact) => _$CatFactToJson(this);
}
