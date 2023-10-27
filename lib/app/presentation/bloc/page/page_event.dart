part of 'page_bloc.dart';

sealed class PageEvent extends Equatable {
  final int index;
  const PageEvent(this.index);

  @override
  List<Object> get props => [];
}

class PageIndexChanged extends PageEvent {
  const PageIndexChanged(int index) : super(index);
}
