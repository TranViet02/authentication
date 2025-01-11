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
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Đăng nhập",style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.black12,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Expanded(
                 child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://itviec.com/blog/wp-content/uploads/2024/05/login-form-html-spotify-vippro.jpeg'), // Link ảnh nền Register
                      fit: BoxFit.cover,
                    ),
                  ),
                               ),
               ),
              SizedBox(height: 20,),
              TextField(
                controller: usernameController,
                decoration:const InputDecoration(
                  labelText: "Tên đăng nhập",
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
                  labelText: "Mật khẩu",
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
                      const SnackBar(content: Text("Đăng nhập thành công")),
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
                        usernameController.text,
                        passwordController.text,
                      );
                    },
                    child: const Text("Đăng nhập"),
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
                child: const Text("Chưa có tài khoản? Đăng ký"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
