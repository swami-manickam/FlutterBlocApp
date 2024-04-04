import 'package:flutter_sample_bloc_pattern/data/model/product_details.dart';
import 'package:flutter_sample_bloc_pattern/data/provider/product_list_provider.dart';

class ProductListRepository {
  final ProductListProvider _productListProvider = ProductListProvider();

  //
  Future<ProductDetails> fetchProductListDetails() async =>
      _productListProvider.fetchProductDetails();
}
