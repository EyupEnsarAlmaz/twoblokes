import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoblokes/product/bloc/news/news_event.dart';
import 'package:twoblokes/product/bloc/news/news_state.dart';
import 'package:twoblokes/services/news_service.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
  }

  Future<void> _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final news = await newsService.getBusinessNews();
      emit(NewsLoaded(news));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
