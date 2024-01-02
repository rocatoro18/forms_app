import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

// YO NO PUEDO MUTAR EL ESTADO, ESTE ES INMUTABLE

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 5));

  void increaseBy(int value) {
    // SE EMITE UN NUEVO ESTADO USANDO EL copyWith
    emit(state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1));
  }

  void reset() {
    // SE EMITE UN NUEVO ESTADO USANDO EL copyWith
    emit(state.copyWith(counter: 0));
  }
}
