import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/components/search_field.dart';
import 'package:flutter_sample_bloc_pattern/config/size_config.dart';
import 'package:flutter_sample_bloc_pattern/data/model/product_details.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/circle_tabs.dart';

class ProductListWidget extends StatelessWidget {
  final ProductDetails productDetails;

  const ProductListWidget({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(height: getRelativeHeight(0.025)),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SearchField()),
          SizedBox(height: getRelativeHeight(0.025)),
          _buildHorizontalList(),
          SizedBox(height: getRelativeHeight(0.025)),
          _buildCategoryList(context),
          SizedBox(height: getRelativeHeight(0.025)),
          _buildScrollVerticalList(),
        ],
      ),
    ));
  }

  Widget _buildCategoryList(BuildContext context) {
    double hori = 25;
    double vert = 15;

    return SizedBox(
      height: 100,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
            child: const SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //It will be functional on next update
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: true,
                    data: "All",
                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: false,
                    data: "Pongal Mix",

                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: false,
                    data: "Broken Mix",
                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: false,
                    data: "Podi Mix",
                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: false,
                    data: "Podi Mix",
                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                  CircleTab(
                    icon: Icons.construction,
                    isSelected: false,
                    data: "Podi Mix",
                    // iconSize: 20,
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          )
        ]),
      ]),
    );
  }

  Widget _buildHorizontalList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: productDetails.drinks.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 180,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              /*color: Colors.green,*/
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    child: Image.network(
                      productDetails.drinks[index].strDrinkThumb ?? "",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  /* const SizedBox(height: 8.0),*/
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScrollVerticalList() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: productDetails.drinks.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor, width: 3.0),
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.network(
                        productDetails.drinks[index].strDrinkThumb ?? "",
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Column(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                  productDetails.drinks[index].strCategory ??
                                      "",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                  productDetails.drinks[index].strAlcoholic ??
                                      "",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                productDetails.drinks[index].strInstructions ??
                                    "",
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
