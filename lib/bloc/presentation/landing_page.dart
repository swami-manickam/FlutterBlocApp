import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/domain/navigationtab/landing_page_bloc.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/product_list_screen.dart';
import 'package:flutter_sample_bloc_pattern/bloc/presentation/user_details_screen.dart';

import '../../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _LandingPageState();
}

class _LandingPageState extends State<HomePage> {
  final LandingPageBloc landingPageBloc = LandingPageBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const ProductListScreen(),
      const UserDetailsScreen(),
      const UserDetailsScreen(),
      const UserDetailsScreen(),
    ];
    return BlocConsumer<LandingPageBloc, LandingPageInitial>(
        bloc: landingPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Center(
                    child: Text(
                  state.appBarName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
                elevation: 0,
                leading: Builder(
                    builder: (context) => Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "notifications");
                        },
                        icon: const Icon(Icons.notifications)),
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: bottomNavItems,
                currentIndex: state.tabIndex,
                selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                elevation: 10,
                onTap: (index) {
                  var appBarTitle = appBarText[index];
                  landingPageBloc.add(LandingPageTabChangeEvent(
                      tabIndex: index, appBarName: appBarTitle));
                },
              ),
              body: pages[state.tabIndex]);
        });
  }
}
