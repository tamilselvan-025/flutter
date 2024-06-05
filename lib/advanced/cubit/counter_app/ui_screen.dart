import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/cubit/counter_app/counter_model.dart';
import 'package:flutter_basics/advanced/cubit/counter_app/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<CounterCubit>(
      create: (_) => CounterCubit(),
      child: const MaterialApp(
        home: Home(),
      )));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                debugPrint("listener called");
                if (state.wasIncremented != null) {
                  if (state.wasIncremented!) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("value incremented"),
                      duration: Duration(seconds: 2),
                    )
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("value decremented"),
                      duration: Duration(seconds: 2),
                    )
                    );
                  }
                }
                },
              builder: (context,state){
                debugPrint("builder called");
                return Text("Counter value : ${state.number}");
              }
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                child: const Text("Decrement")),
          ],
        ),
      ),
    );
  }
}
