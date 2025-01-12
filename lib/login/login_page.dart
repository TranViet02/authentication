// lib/pages/login_page.dart
import 'package:authendication_app/home/home_page.dart';
import 'package:authendication_app/login/login_cubit.dart';
import 'package:authendication_app/login/login_state.dart';
import 'package:authendication_app/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Đăng nhập",style: TextStyle(color: Colors.white),),),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration:const InputDecoration(
                  labelText: "User name",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1), 
                    ),
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Pasword",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1), 
                    ),
                ),
              ),
              const SizedBox(height: 20),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login successfully")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                      context.read<LoginCubit>().login(
                        usernameController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      backgroundColor: Colors.blueAccent, 
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 15,  // Đổ bóng
                      shadowColor: Colors.blueAccent.withOpacity(0.5),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );

                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: const Text("Don't have an account? Sign up", style: TextStyle(color: Colors.black, fontSize: 18),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
