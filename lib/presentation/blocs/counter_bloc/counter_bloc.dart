import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // ESTE ES EL CONSTRUCTOR
  CounterBloc() : super(const CounterState()) {
    // CUERPO DEL CONSTRUCTOR
    // HANDLER O MANEJADOR DE UN CounterEvent
    // HANDLER DE EVENTO
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    // EMISION DE UN NUEVO EVENTO
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    // EMISION DE UN NUEVO EVENTO
    emit(state.copyWith(counter: 0));
  }

  // DISPARAR EVENTOS DENTRO DEL BLOC
  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  // DISPARAR EVENTOS DENTRO DEL BLOC
  void resetCounter() {
    add(CounterReset());
  }
}
