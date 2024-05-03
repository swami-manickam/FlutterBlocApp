import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final outlineBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(30),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            fillColor: secondaryColor,
            filled: true,
            hintText: "Search Products",
            hintStyle: const TextStyle(
              fontSize: 16.0, // Adjust the font size as needed
              color: Colors.white,
            ),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            suffixIcon: Container(
              width: 100.0, // Adjust the width as needed
              height: 40.0, // Adjust the height as needed
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFBA473), Color(0xffFA7A30)],
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0, // Adjust the font size as needed
                      ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            border: outlineBorder,
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
          ),
        ),
      ),
    );
  }
}
