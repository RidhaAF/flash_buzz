import 'package:dio/dio.dart';
import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/domain/repositories/news_repository.dart';
import 'package:flash_buzz/app/utils/helpers/dio_helper.dart';

class NewsRepositoryImpl implements NewsRepository {
  Dio dio = DioHelper.dio;

  @override
  Future<NewsModel> getTopHeadlines() async {
    String url = '/top-headlines?pageSize=10&page=1';

    try {
      Response res = await dio.get(url);

      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      } else {
        throw Exception('Failed to load data $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
