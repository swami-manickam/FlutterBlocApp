import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/constants/constants.dart';
import 'package:flutter_sample_bloc_pattern/data/model/user_details.dart';

class ProductDetailWidget extends StatelessWidget {
  final UserDetails userDetails;

  const ProductDetailWidget({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return _buildHorizontalImage(context);
  }

  Widget _buildHorizontalImage(BuildContext context) {
    //String myMarkerThumb = userDetails.image;
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 1.5 / 2.7,
                    child: GestureDetector(
                      child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(productUrl),
                                  fit: BoxFit.cover)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    stops: const [
                                      .2,
                                      .9
                                    ],
                                    colors: [
                                      Colors.black.withOpacity(.4),
                                      Colors.black.withOpacity(.3)
                                    ])),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {},
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 300),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                width: 1.5,
                                                color: true
                                                    ? Colors.red
                                                    : Colors.transparent,
                                              )),
                                          child: true
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons.favorite,
                                                  color: Colors.white,
                                                )),
                                    ),
                                  ),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "\$ 15.00",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Vegetarian Pizza",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  )),
        )),
        SizedBox(
          height: 40,
        )
      ],
    ));
  }
}
