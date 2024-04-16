import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/data/model/user_details.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails userDetails;

  const UserDetailsWidget({Key? key, required this.userDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProduct(context);
  }

  Widget _buildProduct(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.78,
      children: List.generate(
        15,
        (index) => InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 5.0),
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            margin:
                const EdgeInsets.only(bottom: 10, left: 15, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120, // Set the desired height for the container
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      userDetails.image ?? "",
                      fit: BoxFit.cover,
                      width: double
                          .infinity, // Take the full width of the container
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          userDetails.name ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          userDetails.won.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs ${userDetails.winningPercentage.toString()}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/ic_cart.png",
                            width: 25,
                            height: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 5),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        children: List.generate(
          15,
          (index) => InkWell(
            onTap: () {},
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
                          userDetails.image ?? "",
                          fit: BoxFit.cover,
                          width: double
                              .infinity, // Take the full width of the container
                        ),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          userDetails.name ?? "",
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          userDetails.won.toString(),
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Rs ${userDetails.winningPercentage.toString()}",
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
