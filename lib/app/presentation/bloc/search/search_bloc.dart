import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_buzz/app/data/models/search_model.dart';
import 'package:flash_buzz/app/domain/usecases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsecase searchUsecase;
  late SearchModel searchModel;
  int page = 1;

  SearchBloc(this.searchUsecase) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      await searchNews(event, emit);
    });
  }

  Future<void> searchNews(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      if (event.query.isEmpty) {
        emit(SearchInitial());
        return;
      }
      emit(SearchLoading());
      page = 1;
      searchModel = await searchUsecase.searchNews(
        query: event.query,
        page: page,
      );
      emit(SearchLoaded(searchModel));
    } catch (e) {
      emit(SearchError(e.toString()));
      throw Exception('Failed to search: $e');
    }
  }

  Future<void> getMoreSearchNews(String query) async {
    try {
      if (searchModel.articles != null &&
          searchModel.totalResults != null &&
          searchModel.articles!.length < searchModel.totalResults!) {
        page++;
        final SearchModel newestSearch =
            await searchUsecase.searchNews(query: query, page: page);

        if (newestSearch.articles != null) {
          searchModel.articles!.addAll(newestSearch.articles!);
        }
      }
    } catch (e) {
      throw Exception('Failed to fetch more search news: $e');
    }
  }

  clearSearch(
    SearchEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchInitial());
    searchModel = SearchModel();
  }
}
