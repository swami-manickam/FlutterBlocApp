import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/components/items_slider.dart';
import 'package:flutter_sample_bloc_pattern/constants/constants.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class FavouriteListWidget extends StatefulWidget {
  const FavouriteListWidget({super.key});

  @override
  State<FavouriteListWidget> createState() => _FavouriteListWidgetState();
}

class _FavouriteListWidgetState extends State<FavouriteListWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildFavouriteView(context);
  }

  Widget _buildFavouriteView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 5),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        children: List.generate(
          15,
          (index) => InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ItemSlider(true)));
            },
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 5, left: 0, right: 0, top: 5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(children: [
                    Column(
                      children: [
                        Image.network(
                          height: 100,
                          productUrl,
                          fit: BoxFit.cover,
                          width: double
                              .infinity, // Take the full width of the container
                        ),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          'Vegetarian Pizza',
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Tasty and yummy food',
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Rs ${'150.00'}",
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        /*RatingBar.builder(
              itemSize: 20,
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )*/
                      ],
                    ),
                    Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: const EdgeInsets.all(5),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                )),
                          ),
                        )),
                  ]),
                ),
                elevation: 0,
                color: const Color.fromRGBO(244, 244, 244, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
