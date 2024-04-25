import 'package:flutter/material.dart';

class OnboardImage extends StatelessWidget {
  final String onboardImg;
  final bool skip;
  final String title;
  final String desc;
  final int currentPageIndex;

  const OnboardImage({
    Key? key,
    required this.currentPageIndex,
    required this.onboardImg,
    required this.title,
    required this.desc,
    required this.skip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(130),
              ),
              child: Image.network(
                onboardImg,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 500,
              ),
            ),
            if (skip)
              Positioned(
                top: 40,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentPageIndex != onboardList.length - 1) {
                    } else {}
                  },
                  child: const Text('Skip'),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class OnboardItem {
  final String title;
  final String description;
  final String image;

  OnboardItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardItem> onboardList = [
  OnboardItem(
    title: "Welcome to MyApp",
    description: "This is a description of MyApp.",
    //image: "assets/images/splash_banner.png",
    image:
        "https://media.istockphoto.com/id/1329972777/photo/selection-of-healthy-food.jpg?s=1024x1024&w=is&k=20&c=7CjfDgJEn1c7N-lbWCj9oIvg-TOWeKFM4tdnIhvC6zM=",
  ),
  OnboardItem(
    title: "Explore Features",
    description: "Discover all the amazing features.",
    image:
        "https://media.istockphoto.com/id/1319902998/photo/magnesium.jpg?s=1024x1024&w=is&k=20&c=cZ9usLqa2p-h28DZY2XDn44lfvU68-qPyOuYA3KCGQ0=",
  ),
  OnboardItem(
    title: "Get Started",
    description: "Let's get started with MyApp.",
    image:
        "https://images.unsplash.com/photo-1546702005-7f8e5aeab4a6?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
];
