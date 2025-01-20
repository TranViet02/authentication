import 'package:authendication_app/home/home_cubit.dart';
import 'package:authendication_app/home/home_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..start(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  String minutes = state.remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
                  String seconds = state.remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');
                  return Text(
                    "$minutes:$seconds",
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
                          backgroundColor: Colors.blueAccent, 
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 15,
                          shadowColor: Colors.blueAccent.withOpacity(0.5),
                    ),
                    onPressed: () {
                      if (state.isRunning) {
                        context.read<HomeCubit>().stop();
                      } else {
                        context.read<HomeCubit>().start();
                      }
                    },
                    child: Text(state.isRunning ? "Dừng lại" : "Bắt đầu"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
