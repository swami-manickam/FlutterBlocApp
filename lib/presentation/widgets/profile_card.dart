import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/data/model/user_details.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.userDetails}) : super(key: key);
  final UserDetails userDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                userDetails.image!!,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userDetails.name!!,
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      userDetails.played.toString(),
                      style: const TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
