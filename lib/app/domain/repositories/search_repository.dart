import 'package:flash_buzz/app/data/models/search_model.dart';

abstract class SearchRepository {
  Future<SearchModel> searchNews({required String query});
}
