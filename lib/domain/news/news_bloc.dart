import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sample_bloc_pattern/data/model/news/categories_new_model.dart';
import 'package:flutter_sample_bloc_pattern/data/model/news/news_channel_headlines_model.dart';
import 'package:flutter_sample_bloc_pattern/data/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository = NewsRepository();

  NewsBloc() : super(NewsState()) {
    on<FetchNewsChannelHeadlines>(fetchChannelNews);
    on<NewsCategories>(fetchNewsCategories);
  }

  Future<void> fetchChannelNews(
      FetchNewsChannelHeadlines event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: Status.initial));

    await newsRepository.fetchNewsChannel(event.channelId).then((value) {
      emit(state.copyWith(
          status: Status.success, newsList: value, message: 'Success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          categoriesStatus: Status.failure,
          categoriesMessage: error.toString()));
    });
  }

  Future<void> fetchNewsCategories(
      NewsCategories event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: Status.initial));

    await newsRepository.fetchNewsCategories(event.category).then((value) {
      emit(state.copyWith(
          categoriesStatus: Status.success,
          categoriesNewsModel: value,
          categoriesMessage: 'Success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          categoriesStatus: Status.failure,
          categoriesMessage: error.toString()));

      emit(state.copyWith(status: Status.failure, message: error.toString()));
    });
  }
}
