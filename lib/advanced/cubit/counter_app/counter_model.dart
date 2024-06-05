import 'package:flutter_basics/advanced/cubit/counter_app/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0,null));

  void increment() => emit(CounterState(state.number+1,true));

  void decrement() => emit(CounterState(state.number-1,false));
}
