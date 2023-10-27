import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, int> {
  PageBloc() : super(0) {
    on<PageIndexChanged>((event, emit) {
      emit(event.index);
    });
  }
}
