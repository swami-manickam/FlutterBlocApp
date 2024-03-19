import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/repository/product_list_repository.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/product/product_list_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/user_details_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/product_list_screen.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/user_details_screen.dart';

import '../data/repository/user_details_repository.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grid_3x3),
    label: 'Category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_outlined),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favourite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  BlocProvider(
    create: (context) =>
        ProductListBloc(productListRepository: ProductListRepository()),
    child: ProductListScreen(),
  ),
  BlocProvider(
    create: (context) =>
        UserDetailsBloc(userDetailsRepository: UserDetailsRepository()),
    child: UserDetailsScreen(),
  ),
  const Text(
    'Index 2: Search',
  ),
  const Text(
    'Index 3: Favourite',
  ),
  const Text(
    'Index 4: Cart',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
