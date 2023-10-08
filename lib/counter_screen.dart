import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                CounterCubit().get(context).incrementCounter();
              },
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have pushed the button :"),
                  Text(
                    "${CounterCubit().get(context).x}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
