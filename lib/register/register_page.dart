// lib/pages/register_page.dart
import 'package:authendication_app/login/login_cubit.dart';
import 'package:authendication_app/login/login_page.dart';
import 'package:authendication_app/register/register_cubit.dart';
import 'package:authendication_app/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đăng ký tài khoản")),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: "Tên đăng nhập",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1), 
                    ),
                  ),
                focusNode: FocusNode(),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mật khẩu",
                 labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1), 
                    ),
                  ),
              ),
              const SizedBox(height: 20),
             BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.isSuccess) { 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đăng ký thành công")),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
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
                return ElevatedButton(
                  onPressed: () {
                    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu")),
                      );
                      return;
                    }

                    print("Tên đăng nhập: ${usernameController.text}");
                    print("Mật khẩu: ${passwordController.text}");
                    context.read<RegisterCubit>().register(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  child: const Text("Đăng ký"),
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