import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

///generate -g with command:
///flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Food {
  final int? count;

  Food(this.count,);

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  Map<String, dynamic> toJson() => _$FoodToJson(this);

}