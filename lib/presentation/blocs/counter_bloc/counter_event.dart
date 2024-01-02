part of 'counter_bloc.dart';

// NOS PERMITE PODER DECIR QUE TIPOS DE EVENTOS
// VA A RECIBIR EL BLOC Y CON CUALES VA A TRABAJAR
sealed class CounterEvent {
  const CounterEvent();

  // DE MOMENTO NO ES NECESARIO COMPARAR EVENTOS
  //@override
  //List<Object> get props => [];
}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

// CounterReset
// NO NECESITA NINGUN ARGUMENTO
class CounterReset extends CounterEvent {}
