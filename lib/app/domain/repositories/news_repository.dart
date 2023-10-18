import 'package:flash_buzz/app/data/models/news_model.dart';

abstract class NewsRepository {
  Future<NewsModel> getTopHeadlines();
}
