part of 'page_bloc.dart';

sealed class PageState extends Equatable {
  const PageState();
  
  @override
  List<Object> get props => [];
}

final class PageInitial extends PageState {}
