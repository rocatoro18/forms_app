part of 'counter_cubit.dart';

// ESTA ES LA FORMA DE COMO LUCE MI ESTADO
class CounterState extends Equatable {
  final int counter;
  final int transactionCount;

  // NUESTRO ESTADO INICIAL
  const CounterState({this.counter = 0, this.transactionCount = 0});

  // EMITIR UNA NUEVA INSTANCIA DE ESTE ESTADO
  copyWith({int? counter, int? transactionCount}) => CounterState(
      counter: counter ?? this.counter,
      transactionCount: transactionCount ?? this.transactionCount);

  // TODAS LAS PROPIEDAS QUE YO QUIERO CONSIDERAR PARA SABER SI EL ESTADO VA
  // A SER IGUAL [counter, transactionCount]
  @override
  List<Object> get props => [counter, transactionCount];
}
