import 'dart:convert';

import 'package:flutter_sample_bloc_pattern/data/model/news/categories_new_model.dart';
import 'package:flutter_sample_bloc_pattern/data/model/news/news_channel_headlines_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<CategoriesNewsModel> fetchNewsCategories(String category) async {
    String newsUrl =
        'https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448';

    final response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      final catRes = jsonDecode(response.body);

      return CategoriesNewsModel.fromJson(catRes);
    } else {
      throw Exception('Error');
    }
  }

  Future<NewsChannelsHeadlinesModel> fetchNewsChannel(
      String newsChannel) async {
    String newsUrl =
        'https://newsapi.org/v2/top-headlines?sources=${newsChannel}&apiKey=8a5ec37e26f845dcb4c2b78463734448';
    final response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      final newsRes = jsonDecode(response.body);

      return NewsChannelsHeadlinesModel.fromJson(newsRes);
    } else {
      throw Exception('Error');
    }
  }
}
