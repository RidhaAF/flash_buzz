import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/domain/usecases/news_usecase.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final NewsUsecase newsUsecase;
  bool isInit = false;
  late NewsModel newsModel;
  int page = 1;

  TopHeadlinesBloc(this.newsUsecase) : super(TopHeadlinesInitial()) {
    on<TopHeadlinesEvent>((event, emit) async {
      await getTopHeadlines(event, emit);
    });
  }

  Future<void> getTopHeadlines(
    TopHeadlinesEvent event,
    Emitter<TopHeadlinesState> emit,
  ) async {
    try {
      emit(TopHeadlinesLoading());
      page = 1;
      newsModel = await newsUsecase.getTopHeadlines(page: page);
      emit(TopHeadlinesLoaded(newsModel));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
      throw Exception('Failed to fetch top headlines: $e');
    }
  }

  Future<void> getMoreTopHeadlines() async {
    try {
      if (newsModel.articles != null &&
          newsModel.totalResults != null &&
          newsModel.articles!.length < newsModel.totalResults!) {
        page++;
        final NewsModel newestNews =
            await newsUsecase.getTopHeadlines(page: page);

        if (newestNews.articles != null) {
          newsModel.articles!.addAll(newestNews.articles!);
        }
      }
    } catch (e) {
      throw Exception('Failed to fetch more top headlines: $e');
    }
  }
}
