import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/product_list_repository.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/product/product_list_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/widgets/product_list_widgets.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late final ProductListRepository _productListRepository;
  late final ProductListBloc _productListBloc;

  @override
  void initState() {
    _productListRepository = ProductListRepository();
    _productListBloc =
        ProductListBloc(productListRepository: _productListRepository);
    _productListBloc.add(ProductDetailsInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text('Flutter BLOC Demo'),
        ),*/
        body: Align(
      alignment: Alignment.topCenter,
      child: _buildProductList(), // replace 'Widget' with your widget
    ));
  }

  Widget _buildProductList() {
    return Center(
      child: BlocBuilder(
          bloc: _productListBloc,
          builder: (BuildContext context, ProductListState state) {
            if (state is ProductListLoading) {
              return CircularProgressIndicator();
            }
            if (state is ProductListLoaded) {
              return ProductListWidget(productDetails: state.productDetails);
            }
            return const Text('Unable to fetch the product details!!!');
          }),
    );
  }
}
