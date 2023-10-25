import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash_buzz/app/data/models/search_model.dart';
import 'package:flash_buzz/app/domain/usecases/search_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsecase searchUsecase;
  late SearchModel searchModel;

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
      searchModel = await searchUsecase.searchNews(query: event.query);
      emit(SearchLoaded(searchModel));
    } catch (e) {
      emit(SearchError(e.toString()));
      throw Exception('Failed to search: $e');
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
