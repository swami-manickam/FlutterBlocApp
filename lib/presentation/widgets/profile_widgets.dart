import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildProfileWidget(context);
  }

  Widget _buildProfileWidget(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            child: const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text(
                    'Product Name',
                    style: TextStyle(color: whiteColor),
                  ),
                  subtitle: Text(
                    'Product Description',
                    style: TextStyle(color: whiteColor),
                  ),
                  trailing: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/ic_avatar.png')),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: GridView.count(
                crossAxisSpacing: 30,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem(),
                  ProfileWidgetItem()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ProfileWidgetItem() => Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
            child: Icon(
              Icons.add_a_photo,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('My OPtion')
        ],
      ));
}
