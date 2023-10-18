part of 'top_headlines_bloc.dart';

sealed class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();

  @override
  List<Object> get props => [];
}

final class TopHeadlinesInitial extends TopHeadlinesState {}

final class TopHeadlinesLoading extends TopHeadlinesState {}

final class TopHeadlinesLoaded extends TopHeadlinesState {
  final NewsModel newsModel;

  const TopHeadlinesLoaded(this.newsModel);

  @override
  List<Object> get props => [newsModel];
}

final class TopHeadlinesError extends TopHeadlinesState {
  final String message;

  const TopHeadlinesError(this.message);

  @override
  List<Object> get props => [message];
}
