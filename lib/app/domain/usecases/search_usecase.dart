import 'package:flash_buzz/app/data/models/search_model.dart';
import 'package:flash_buzz/app/domain/repositories/search_repository.dart';

class SearchUsecase {
  final SearchRepository _searchRepository;

  SearchUsecase(this._searchRepository);

  Future<SearchModel> searchNews({required String query, int page = 1}) async {
    return await _searchRepository.searchNews(query: query, page: page);
  }
}
