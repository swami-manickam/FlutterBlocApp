import 'dart:async';

import 'package:bloc/bloc.dart' show Bloc;
import 'package:flutter/foundation.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/model/product_details.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/product_list_repository.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductListRepository productListRepository;
  ProductListBloc({required this.productListRepository})
      : super(ProductListLoading());
  @override
  Stream<ProductListState> mapEventToState(
    ProductListEvent event,
  ) async* {
    yield ProductListLoading();
    try {
      ProductDetails productDetails =
          await productListRepository.fetchProductListDetails();
      await Future.delayed(Duration(seconds: 5));
      yield ProductListLoaded(productDetails);
    } catch (e) {
      if (kDebugMode) {
        print("Exception while fetching product details: $e");
      }
      yield ProductListError();
    }
  }
}
