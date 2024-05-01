import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/data/model/user_details.dart';
import 'package:flutter_sample_bloc_pattern/presentation/widgets/product_detail_widgets_new.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserDetails userDetails;

  const UserDetailsWidget({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _buildProduct(context),
          // ProfileCard(userDetails: userDetails)
        ],
      ),
    ));
  }

  Widget _buildProduct(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.78,
      children: List.generate(
        15,
        (index) => InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductWidgetDetailNew()));
          },
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
}
