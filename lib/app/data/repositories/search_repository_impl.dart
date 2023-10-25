import 'package:dio/dio.dart';
import 'package:flash_buzz/app/data/models/search_model.dart';
import 'package:flash_buzz/app/domain/repositories/search_repository.dart';
import 'package:flash_buzz/app/utils/helpers/dio_helper.dart';

class SearchRepositoryImpl implements SearchRepository {
  Dio dio = DioHelper.dio;

  @override
  Future<SearchModel> searchNews({
    required String query,
    required int page,
  }) async {
    String url = '/everything?q=$query&pageSize=10&page=$page';

    try {
      Response res = await dio.get(url);

      if (res.statusCode == 200) {
        return SearchModel.fromJson(res.data);
      } else {
        throw Exception('Failed to load data $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
