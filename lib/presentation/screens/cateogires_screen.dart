import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_bloc_pattern/domain/news/news_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: categoryName == categoriesList[index]
                                  ? Colors.blue
                                  : Colors.grey),
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
            SizedBox(
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
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      state.newsCategoriesList!.articles![index]
                                          .urlToImage
                                          .toString(),
                                      fit: BoxFit.cover,
                                      height: height * .18,
                                      width: width * .3,
                                      /* placeholder: (context, url) => Container(
                                        child: Center(
                                          child: ClipOval(),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),*/
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: height * .18,
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Text(
                                            state.newsCategoriesList!
                                                .articles![index].title
                                                .toString(),
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Text(
                                                dateFormat.format(dateTime),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
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
