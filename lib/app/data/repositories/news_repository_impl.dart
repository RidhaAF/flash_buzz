import 'package:dio/dio.dart';
import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/domain/repositories/news_repository.dart';
import 'package:flash_buzz/app/utils/helpers/dio_helper.dart';
import 'package:flash_buzz/env.dart';

class NewsRepositoryImpl implements NewsRepository {
  Dio dio = DioHelper.dio;
  final String country = Env.country;

  @override
  Future<NewsModel> getTopHeadlines({required int page}) async {
    String url = '/top-headlines?country=$country&pageSize=10&page=$page';

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
