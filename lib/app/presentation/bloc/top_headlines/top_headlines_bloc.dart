import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/domain/usecases/news_usecase.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final NewsUsecase newsUsecase;
  late NewsModel newsModel;

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
      newsModel = await newsUsecase.getTopHeadlines();
      emit(TopHeadlinesLoaded(newsModel));
    } catch (e) {
      emit(TopHeadlinesError(e.toString()));
    }
  }
}
