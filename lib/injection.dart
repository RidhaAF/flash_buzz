import 'package:flash_buzz/app/data/repositories/news_repository_impl.dart';
import 'package:flash_buzz/app/data/repositories/search_repository_impl.dart';
import 'package:flash_buzz/app/domain/repositories/news_repository.dart';
import 'package:flash_buzz/app/domain/repositories/search_repository.dart';
import 'package:flash_buzz/app/domain/usecases/news_usecase.dart';
import 'package:flash_buzz/app/domain/usecases/search_usecase.dart';
import 'package:flash_buzz/app/presentation/bloc/page/page_bloc.dart';
import 'package:flash_buzz/app/presentation/bloc/search/search_bloc.dart';
import 'package:flash_buzz/app/presentation/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt di = GetIt.instance;

void setup() {
  di.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl());
  di.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());

  di.registerLazySingleton(() => NewsUsecase(di<NewsRepository>()));
  di.registerLazySingleton(() => SearchUsecase(di<SearchRepository>()));

  di.registerFactory(() => PageBloc());
  di.registerFactory(() => TopHeadlinesBloc(di<NewsUsecase>()));
  di.registerFactory(() => SearchBloc(di<SearchUsecase>()));
}
