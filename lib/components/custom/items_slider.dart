import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:flutter_sample_bloc_pattern/utils/data.dart';

class ItemSlider extends StatefulWidget {
  final bool isExpanded;

  const ItemSlider(this.isExpanded, {super.key});

  @override
  State<ItemSlider> createState() => _ItemSliderState();
}

class _ItemSliderState extends State<ItemSlider> {
  double pageValue = 0.0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 1.3)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: Container(
        child: PageView.builder(
          itemCount: productItems.length,
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double angle = (pageValue - index).abs();

            Widget getPlate(Widget child) {
              /// Sliding the movie card in focus a little but up
              if (index == pageValue.floor() + 1 ||
                  index == pageValue.floor() + 2) {
                return Transform.translate(
                  offset: Offset(0.0, 300 * (index - pageValue)),
                  child: child,
                );
              } else if (index == pageValue.floor() ||
                  index == pageValue.floor() - 1) {
                return Transform.translate(
                  offset: Offset(0.0, 300 * (pageValue - index)),
                  child: child,
                );
              } else {
                return child;
              }
            }

            ProductData item = productItems[index];
            return Stack(
              children: [
                Positioned(
                  top: -100,
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    opacity: angle < 0.65 ? 1 : 0,
                    // opacity: angle > 0.5 ? (0.5 - (1 - angle)) : (0.5 - angle),
                    child: Transform.scale(
                      scale: 1.1,
                      child: Transform.rotate(
                          angle: -angle * 1.5, child: buildFilter(item.image)),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: widget.isExpanded ? -30 : 100,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(125),
                      child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: getPlate(Transform.rotate(
                                  angle: angle * 2.5,
                                  child: Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                    /*height: 500,*/
                                  ))))),
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: angle < 0.15 ? 1 : 0,
                    child: Column(
                      children: [
                        Text(
                          item.name,
                          style: const TextStyle(
                              color: primaryColor, fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "\$ ${item.price}",
                          style: const TextStyle(
                              color: primaryColor, fontSize: 16),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}

Widget buildFilter(String image) {
  return ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    child: Image.network(image),
  );
}
