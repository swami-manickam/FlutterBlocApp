import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/components/search_field.dart';
import 'package:flutter_sample_bloc_pattern/config/size_config.dart';
import 'package:flutter_sample_bloc_pattern/data/model/product_details.dart';

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
          const SearchField(),
          SizedBox(height: getRelativeHeight(0.025)),
          _buildHorizontalList(),
          SizedBox(height: getRelativeHeight(0.025)),
          _buildScrollVerticalList(),
        ],
      ),
    ));
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productDetails.drinks.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 200,
            padding: const EdgeInsets.all(8.0),
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
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                /*Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${productDetails.drinks[index].strCategory ?? ""}"),
                    Text("${productDetails.drinks[index].strAlcoholic ?? ""}"),
                    //Text("${productDetails.drinks[index].strInstructions ?? ""}"),
                  ],
                ),*/
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildScrollVerticalList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: productDetails.drinks.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 3.0),
                color: Colors.grey,
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
                          Text(productDetails.drinks[index].strCategory ?? "")
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Text(productDetails.drinks[index].strAlcoholic ?? "")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            productDetails.drinks[index].strInstructions ?? "",
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                    /*SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              productDetails.drinks[index].strInstructions ??
                                  "",
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
