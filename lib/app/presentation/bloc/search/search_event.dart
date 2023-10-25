part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  final String query;
  const SearchEvent(this.query);

  @override
  List<Object> get props => [];
}

final class SearchNews extends SearchEvent {
  const SearchNews(super.query);

  @override
  List<Object> get props => [query];
}

final class ClearSearch extends SearchEvent {
  const ClearSearch() : super('');

  @override
  List<Object> get props => [];
}
