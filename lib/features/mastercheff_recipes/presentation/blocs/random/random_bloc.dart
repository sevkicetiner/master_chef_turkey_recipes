import 'package:bloc/bloc.dart';

import 'random_event.dart';
import 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<RandomState> emit) async {
    emit(state.clone());
  }
}
