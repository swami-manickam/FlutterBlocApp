import 'dart:convert';


class ProductDetails {
  List<ProductDrink> drinks;

  ProductDetails({
    required this.drinks
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      ProductDetails(
        drinks: List<ProductDrink>.from(
            json["drinks"].map((x) => ProductDrink.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}

class ProductDrink {
  String? idDrink;
  String? strDrink;
  String? strAlcoholic;
  String? strCategory;
  String? strDrinkThumb;
  String? strInstructions;
  String? dateModified;

  ProductDrink({
    required this.idDrink,
    required this.strDrink,
    required this.strAlcoholic,
    required this.strCategory,
    required this.strDrinkThumb,
    required this.strInstructions,
    required this.dateModified,
  });

  factory ProductDrink.fromJson(Map<String, dynamic> json) =>
      ProductDrink(
        idDrink: json["idDrink"],
        strDrink: json["strDrink"],
        strAlcoholic: json["strAlcoholic"],
        strCategory: json["strCategory"],
        strDrinkThumb: json["strDrinkThumb"],
        strInstructions: json["strInstructions"],
        dateModified: json["dateModified"],
      );

  Map<String, dynamic> toJson() =>
      {
        "idDrink": idDrink,
        "strDrink": strDrink,
        "strAlcoholic": strAlcoholic,
        "strCategory": strCategory,
        "strDrinkThumb": strDrinkThumb,
        "strInstructions": strInstructions,
        "dateModified": dateModified,
      };
}
