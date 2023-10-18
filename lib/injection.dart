import 'package:flash_buzz/app/data/repositories/news_repository_impl.dart';
import 'package:flash_buzz/app/domain/repositories/news_repository.dart';
import 'package:flash_buzz/app/domain/usecases/news_usecase.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setup() {
  di.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());

  di.registerLazySingleton(() => NewsUsecase(di<NewsRepository>()));

  di.registerFactory(() => TopHeadlinesBloc(di<NewsUsecase>()));
}
