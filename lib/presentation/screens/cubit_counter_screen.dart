import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // TAMBIEN AQUI SE PUEDEN ESTAR ESCUCHANDO LOS CAMBIOS QUE TIENE EL STATE
    // CON EL WATCH CADA VEZ QUE EL ESTADO CAMBIE, SE VA A REDIBUJAR ESO
    final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        // BlocBuilder - Leer y construir cuando este CounterState cambia
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen - Contruir el widget solo cuando el CounterState es diferente al CounterState previo
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+3'), onPressed: () => {}),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () => {}),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () => {})
        ],
      ),
    );
  }
}
