import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

///generate -g with command:
///flutter packages pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Example {
  final String? usernane;
  final bool? exist;

  Example(this.usernane, this.exist);

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
