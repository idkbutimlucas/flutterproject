import 'package:iut2021/models/ingredients.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

///generate -g with command:
///flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Products {
  // Id du produit :
  @JsonKey(name: "id")
  String? id;

  // Marques :
  @JsonKey(name: "brands")
  String? brands;

  // Pourcentage en empreinte carbone :
  @JsonKey(name: "carbon_footprint_percent_of_known_ingredients")
  double? carbonFootprint;

  // Conditions de conservation :
  @JsonKey(name: "conservation_conditions_fr")
  String? conservation;

  // Nom du produit :
  @JsonKey(name: "product_name_fr")
  String? name;

  // Image du produit
  @JsonKey(name: "image_url")
  String? imageUrl;

  // Ingredients du produit :
  @JsonKey(name: "ingredients")
  List<Ingredients>? ingredients;

  // Les labels du produit :
  @JsonKey(name: "labels")
  String? labels;

  // Le nutri-score du produit :
  @JsonKey(name: "nutriscore_grade")
  String? nutriscore;

  // Origine du produit
  @JsonKey(name: "origins")
  String? origins;

  // Quantitié de produit :
  @JsonKey(name: "quantity")
  String? quantity;

  // Lieu de vente :
  @JsonKey(name: "stores")
  String? stores;

  Products(
      this.id,
      this.brands,
      this.carbonFootprint,
      this.conservation,
      this.imageUrl,
      this.ingredients,
      this.labels,
      this.name,
      this.nutriscore,
      this.origins,
      this.quantity,
      this.stores);

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
