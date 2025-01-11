// lib/cubit/login_cubit.dart
import 'package:authendication_app/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void login(String username, String password) async {
    emit(state.loading());
    final credentials = await Account.getUserCredentials();
    if (credentials['username'] == username && credentials['password'] == password) {
      emit(state.success());
      return;
    } else {
      emit(state.failure("Sai tên đăng nhập hoặc mật khẩu"));
    }
  }
}
