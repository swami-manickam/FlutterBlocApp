import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/news/news_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoriesScreen> {
  final dateFormat = DateFormat('MM dd, yyyy');
  String categoryName = "General";

  List<String> categoriesList = [
    'General',
    'Entertainment',
    'Health',
    'Sports',
    'Business',
    'Technology'
  ];

  @override
  void initState() {
    super.initState();

    context.read<NewsBloc>().add(NewsCategories('categoryName'));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;

    final height = MediaQuery.sizeOf(context).height * 1;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          categoryName = categoriesList[index];
                        });
                        context.read<NewsBloc>()
                          ..add(NewsCategories(categoryName));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: ShapeDecoration(
                            color: categoryName == categoriesList[index]
                                ? Colors.blue
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                              child: Text(
                                categoriesList[index].toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (BuildContext context, state) {
                switch (state.categoriesStatus) {
                  case Status.initial:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );

                  case Status.failure:
                    return Text(state.categoriesMessage.toString());
                  case Status.success:
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.newsCategoriesList!.articles!.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(state
                                .newsCategoriesList!
                                .articles![index]
                                .publishedAt
                                .toString());
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Container(
                                decoration: ShapeDecoration(
                                    color: secondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      child: Image.network(
                                        state.newsCategoriesList!
                                            .articles![index].urlToImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                        height: height * .18,
                                        width: width * .3,
                                        errorBuilder: (context, url, error) =>
                                            Image.asset(
                                                'assets/images/ic_no_data.jpg',
                                                fit: BoxFit.cover,
                                                height: height * .18,
                                                width: width * .3),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: height * .18,
                                        padding: const EdgeInsets.only(
                                            left: 15,
                                            right: 5,
                                            top: 5,
                                            bottom: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                              state.newsCategoriesList!
                                                  .articles![index].title
                                                  .toString(),
                                              maxLines: 4,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    state
                                                        .newsCategoriesList!
                                                        .articles![index]
                                                        .source!
                                                        .name
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                Text(
                                                  dateFormat.format(dateTime),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
