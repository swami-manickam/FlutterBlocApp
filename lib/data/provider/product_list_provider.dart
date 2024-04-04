import 'dart:convert';

import 'package:flutter_sample_bloc_pattern/data/model/product_details.dart';
import 'package:http/http.dart' as http;

class ProductListProvider {
  final String URL =
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita";

  /// Fetch the user details from given public URL
  Future<ProductDetails> fetchProductDetails() async {
    final response = await http.get(
      Uri.parse(URL),
    );
    if (response.statusCode == 200) {
      print("Success");
      final resData = ProductDetails.fromJson(jsonDecode(response.body));
      return resData;
    }
    throw Exception('Not able to fetch the data: ${response.body}');
  }
}
