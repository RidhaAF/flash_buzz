import 'package:flash_buzz/app/data/models/news_model.dart';
import 'package:flash_buzz/app/domain/repositories/news_repository.dart';

class NewsUsecase {
  final NewsRepository _newsRepository;

  NewsUsecase(this._newsRepository);

  Future<NewsModel> getTopHeadlines() async {
    return await _newsRepository.getTopHeadlines();
  }
}
