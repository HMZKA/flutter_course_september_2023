import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  CounterCubit get(context) => BlocProvider.of(context);
  int x = 0;
  incrementCounter() {
    x++;
    emit(IncrementState());
  }
}
