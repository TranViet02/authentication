import 'package:authendication_app/base/auth_cubit.dart';
import 'package:authendication_app/base/auth_state.dart';
import 'package:authendication_app/login/login_page.dart';
import 'package:authendication_app/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đăng ký tài khoản")),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) => 
                TextField(
                   decoration: const InputDecoration(
                      labelText: "User name",
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                    onChanged: (value) => context.read<AuthCubit>().updateUsername(value),
                ),
              ),
              const SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) => 
                   TextField(
                    obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1),
                        ),
                      ),
                    onChanged: (value) => context.read<AuthCubit>().updatePassword(value),
                                ),
                ),
              const SizedBox(height: 20),
             BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.isSuccess) { 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng kí thành công!")),
                  );
                }
                if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          backgroundColor: Colors.greenAccent, 
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 15, 
                          shadowColor: Colors.greenAccent.withOpacity(0.5),
                        ),
                      onPressed: () {
                        final bloc = context.read<AuthCubit>();
                        bloc.register();
                      },
                        child: const Text("Đăng kí"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          backgroundColor: Colors.greenAccent, 
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 15,
                          shadowColor: Colors.greenAccent.withOpacity(0.5),
                        ),
                      onPressed: () {
                        AutoRouter.of(context).push(const LoginRoute());
                      },
                        child: const Text("Login"),
                      ),
                  ],
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