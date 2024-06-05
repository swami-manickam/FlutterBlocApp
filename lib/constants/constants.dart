import 'package:flutter/material.dart';

const List<String> appBarText = [
  "Home",
  "Category",
  "Favourite",
  "Cart",
  "Profile"
];

const String productUrl =
    'https://plus.unsplash.com/premium_photo-1664648234285-3b238ab7f17b?q=80&w=2487&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_business),
    label: 'Category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    label: 'Favourite',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.photo_rounded),
    label: 'Profile',
  ),
];

List<Widget> widgetItems = const <Widget>[
  Icon(Icons.home, size: 26, color: Colors.white),
  Icon(Icons.message, size: 26, color: Colors.white),
  Icon(Icons.add, size: 26, color: Colors.white),
  Icon(Icons.notifications, size: 26, color: Colors.white),
  Icon(Icons.person, size: 26, color: Colors.white),
];
