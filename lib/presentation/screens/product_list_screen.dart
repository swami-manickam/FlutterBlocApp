import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/product_list_repository.dart';
import 'package:flutter_sample_bloc_pattern/domain/product/product_list_bloc.dart';
import 'package:flutter_sample_bloc_pattern/presentation/widgets/product_list_widgets.dart';

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
              return const CircularProgressIndicator();
            }
            if (state is ProductListLoaded) {
              return ProductListWidget(productDetails: state.productDetails);
            }
            return const Text('Unable to fetch the product details!!!');
          }),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => (current is HomeActionState),
      buildWhen: (previous, current) => (current is! HomeActionState),
      listener: (context, state) {
        if (state is CartNavigateActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is CartIconClickedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Item added to Cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            final filteredList = _searchQuery.isEmpty
                ? loadedState.model
                : loadedState.model
                    .where((element) => element.name
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                    .toList();
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 70,
                title: Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.adamina().fontFamily,
                  ),
                ),
                actions: [
                  badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -5),
                      badgeContent: Text(
                        loadedState.items.length.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      badgeStyle: const badges.BadgeStyle(
                          badgeColor: Colors.deepPurple),
                      child: IconButton(
                        onPressed: () {
                          homeBloc.add(CartNavigateEvent());
                        },
                        icon: Image.asset(
                          "assets/cart.png",
                          width: 30,
                          height: 30,
                        ),
                      )),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
              body: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: "Search",
                              suffixIcon: Icon(
                                Icons.search_outlined,
                                size: 28,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ))),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Stack(children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(18)),
                                margin: const EdgeInsets.only(top: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Text(
                                        "Clearance",
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.adamina()
                                                .fontFamily,
                                            color: Colors.white,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0, left: 20),
                                      child: Text(
                                        "Sale",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.adamina()
                                                .fontFamily,
                                            fontSize: 25),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 38,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: const Center(
                                            child: Text(
                                          " % Up to50%",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 120,
                                child: Image.asset(
                                  'assets/mobile.png',
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: loadedState.model.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        padding: const EdgeInsets.all(5),
                                        margin:
                                            const EdgeInsets.only(right: 18),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Text(
                                          loadedState.model[index].category,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ));
                                  }),
                            ),
                            GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              children: List.generate(
                                  filteredList.length,
                                  (index) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductPage(
                                                        product:
                                                            filteredList[index],
                                                      )));
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 0, right: 15, top: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                    width: double.maxFinite,
                                                    // margin: const EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Image.network(
                                                      filteredList[index]
                                                          .image
                                                          .toString(),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.15,
                                                    )),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        filteredList[index]
                                                            .name,
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: Colors.yellow,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(
                                                      filteredList[index]
                                                          .rating
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12),
                                                    child: Text(
                                                      "Rs ${filteredList[index].price.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .cambo()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        homeBloc.add(
                                                            CartIconClickedEvent(
                                                                product: loadedState
                                                                        .model[
                                                                    index]));
                                                      },
                                                      icon: Image.asset(
                                                        "assets/cart2.png",
                                                        width: 25,
                                                        height: 20,
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          default:
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }*/
}
