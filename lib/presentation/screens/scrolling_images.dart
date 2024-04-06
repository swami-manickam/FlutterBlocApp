import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ScrollingImages extends StatefulWidget {
  final int startingIndex;

  const ScrollingImages({
    super.key,
    required this.startingIndex,
  });

  @override
  State<ScrollingImages> createState() => _ScrollingImagesState();
}

class _ScrollingImagesState extends State<ScrollingImages> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.minScrollExtent) {
        _autoScrollForward();
      } else if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        _autoScrollBackward();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScrollForward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _autoScrollForward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  _autoScrollBackward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
          currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  List<String> images = [
    'https://media.istockphoto.com/id/1329972777/photo/selection-of-healthy-food.jpg?s=1024x1024&w=is&k=20&c=7CjfDgJEn1c7N-lbWCj9oIvg-TOWeKFM4tdnIhvC6zM=',
    'https://media.istockphoto.com/id/1319902998/photo/magnesium.jpg?s=1024x1024&w=is&k=20&c=cZ9usLqa2p-h28DZY2XDn44lfvU68-qPyOuYA3KCGQ0=',
    'https://images.unsplash.com/photo-1546702005-7f8e5aeab4a6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1568623970736-27bea63b4489?q=80&w=2672&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://media.istockphoto.com/id/855098134/photo/health-food-for-fitness.jpg?s=1024x1024&w=is&k=20&c=bR2XJ9nOiEDPudzvOPUak1P5BEuzQ6srB0ZqEoroP3g=',
    'https://media.istockphoto.com/id/1173102150/photo/assortment-of-various-types-of-superfoods.jpg?s=1024x1024&w=is&k=20&c=-CRAKhoqHHi8qboAKHBYkNnCD4Qp31Ybrea-p5Po8fs=',
    'https://media.istockphoto.com/id/1134020377/photo/healthy-ketogenic-low-carb-food-for-balanced-diet.jpg?s=1024x1024&w=is&k=20&c=e96rotbcDE6aFSD_HZH4c1E7bMWLTOWgfL_ChEuDDas=',
    'https://media.istockphoto.com/id/1825389072/photo/assorted-various-spices-various-herbs-and-spices.jpg?s=1024x1024&w=is&k=20&c=vMpm7x8KRpJ1qsoK-sGS_Sl5kNCmAn2u1zsFQw1uScg=',
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: h * 0.6,
        width: w * 0.6,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
              height: h * 0.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: NetworkImage(images[index]), fit: BoxFit.cover)),
            );
          },
        ),
      ),
    );
  }
}
