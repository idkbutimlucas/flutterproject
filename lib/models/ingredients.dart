import 'package:json_annotation/json_annotation.dart';

part 'ingredients.g.dart';

///generate -g with command:
///flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Ingredients {
  String? id;
  @JsonKey(name: "percent_estimate")
  Object? percent;
  String? text;
  String? vegan;
  String? vegetarian;

  Ingredients(this.id, this.percent, this.text, this.vegan, this.vegetarian);

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);
}
