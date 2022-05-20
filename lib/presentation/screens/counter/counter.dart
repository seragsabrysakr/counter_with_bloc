import 'package:counter_with_bloc/businuss_logic/cubit/counter_cubit.dart';
import 'package:counter_with_bloc/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({Key? key}) : super(key: key);

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter With Bloc'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 30,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increament();
                },
                icon: const Icon(Icons.add),
              ),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.number.toString(),
                  style: const TextStyle(
                    color: maincolor,
                    fontSize: 30,
                  ),
                );
              },
            ),
            CircleAvatar(
              radius: 30,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decreament();
                },
                icon: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
