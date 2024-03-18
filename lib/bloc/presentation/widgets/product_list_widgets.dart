import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/bloc/data/model/product_details.dart';

class ProductListWidget extends StatelessWidget {
  final ProductDetails productDetails;

  const ProductListWidget({Key? key, required this.productDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /*SizedBox(
          height: 300,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: productDetails.drinks.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300,
                height: 300,
                  padding: const EdgeInsets.all(8.0),
                *//*color: Colors.green,*//*
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        productDetails.drinks[index].strDrinkThumb ?? "",
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${productDetails.drinks[index].strCategory ?? ""}"),
                        Text("${productDetails.drinks[index].strAlcoholic ?? ""}"),
                        //Text("${productDetails.drinks[index].strInstructions ?? ""}"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),*/
        _buildHorizontalList(),
        _buildVerticalList(),
      ],
    );
  }


  Widget _buildHorizontalList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productDetails.drinks.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(8.0),
            /*color: Colors.green,*/
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    productDetails.drinks[index].strDrinkThumb ?? "",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${productDetails.drinks[index].strCategory ?? ""}"),
                    Text("${productDetails.drinks[index].strAlcoholic ?? ""}"),
                    //Text("${productDetails.drinks[index].strInstructions ?? ""}"),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildVerticalList(){
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: productDetails.drinks.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 300,
            padding: const EdgeInsets.all(8.0),
            /*color: Colors.green,*/
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    productDetails.drinks[index].strDrinkThumb ?? "",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${productDetails.drinks[index].strCategory ?? ""}"),
                    Text("${productDetails.drinks[index].strAlcoholic ?? ""}"),
                    //Text("${productDetails.drinks[index].strInstructions ?? ""}"),
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