part of 'product_list_bloc.dart';

@immutable
abstract class ProductListState {}

/*final class ProductListInitial extends ProductListState {}*/


class ProductListLoading extends ProductListState {
  @override
  String toString() {
    return "ProductListLoading";
  }
}

class ProductListLoaded extends ProductListState {
  final ProductDetails productDetails;
  ProductListLoaded(this.productDetails);

  @override
  String toString() {
    return "ProductDetailsLoaded";
  }
}

class ProductListError extends ProductListState {
  @override
  String toString() {
    return "UserDetailsError";
  }
}
