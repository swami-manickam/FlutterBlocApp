import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class ProductWidgetDetailNew extends StatefulWidget {
  const ProductWidgetDetailNew({super.key});

  @override
  State<ProductWidgetDetailNew> createState() => _ProductWidgetDetailNewState();
}

class _ProductWidgetDetailNewState extends State<ProductWidgetDetailNew> {
  int quantity = 1;

  void addQuantity() {
    setState(() {
      quantity++;
    });
  }

  void removeQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductDetail(context);
  }

  Widget _buildProductDetail(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      //Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      /*decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFFF8C48).withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ],
                      ),*/
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    /*decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFFF8C48).withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ],
                    ),*/
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /*Container(
                    height: 210,
                    width: 210,
                    margin: const EdgeInsets.only(top: 20, right: 70),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),*/
                  Image.asset('assets/images/ic_millet.png',
                      height: 280, width: 280, fit: BoxFit.contain)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: secondaryColor, blurRadius: 10, spreadRadius: 1)
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product Name Foods",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textColor)),
                      Text("\$105",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: secondaryColor))
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 120,
                      height: 35,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: removeQuantity,
                              icon: Icon(
                                CupertinoIcons.minus,
                                color: Colors.white,
                                size: 15,
                              )),
                          Text(quantity.toString(),
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          IconButton(
                            onPressed: addQuantity,
                            icon: Icon(
                              CupertinoIcons.plus,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 25,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _) => Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                        onRatingUpdate: (index) {},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is description of the product. This is description of the product. "
                    "This is description of the product. This is description of the product. This is description of the product. This is description of the product.",
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildNavView(context),
    );
  }

  Widget _buildNavView(BuildContext context) {
    return Container(
      color: appBarColor,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 22, color: whiteColor),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  CupertinoIcons.cart_badge_plus,
                  color: Colors.white,
                  size: 32,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
