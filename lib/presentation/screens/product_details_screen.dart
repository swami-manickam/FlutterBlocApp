import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/user_details_repository.dart';
import 'package:flutter_sample_bloc_pattern/presentation/widgets/product_detail_widgets.dart';

import '../../domain/user_details_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final UserDetailsRepository _userDetailsRepository;
  late final UserDetailsBloc _userDetailsBloc;

  @override
  void initState() {
    _userDetailsRepository = UserDetailsRepository();
    _userDetailsBloc =
        UserDetailsBloc(userDetailsRepository: _userDetailsRepository);
    _userDetailsBloc.add(UserDetailsInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          null /*AppBar(
        title: const Text('Flutter Product App'),
      )*/
      ,
      body: Center(
        child: BlocBuilder(
            bloc: _userDetailsBloc,
            builder: (BuildContext context, UserDetailsState state) {
              if (state is UserDetailsLoading) {
                return const CircularProgressIndicator();
              }
              if (state is UserDetailsLoaded) {
                return ProductDetailWidget(userDetails: state.userDetails);
              }
              return const Text('Unable to fetch the user details!!!');
            }),
      ),
    );
  }

  @override
  void dispose() {
    _userDetailsBloc.close(); // Close the UserDetailsBloc
    super.dispose();
  }
}
