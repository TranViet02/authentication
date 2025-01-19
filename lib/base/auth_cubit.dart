import 'package:authendication_app/account.dart';
import 'package:authendication_app/base/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  String username = '';
  String password = '';

  void updateUsername(String value) {
    username = value.trim();
     emit(state.copyWith());
  }

  void updatePassword(String value) {
    password = value.trim();
     emit(state.copyWith());
  }

  Future<void> register() async {
    emit(state.loading());
    final existingCredentials = await Account.getUserCredentials();

    if (username.isEmpty || password.isEmpty) {
      emit(state.failure("Vui lòng nhập đầy đủ thông tin"));
    } else if (existingCredentials['username'] == username) {
      emit(state.failure("Tên đăng nhập đã tồn tại"));
    } else {
      await Account.saveUserCredentials(username, password);
      emit(state.success());
    }
  }

  Future<void> login() async {
    emit(state.loading());
    final credentials = await Account.getUserCredentials();

    if (username.isEmpty || password.isEmpty) {
      emit(state.failure("Vui lòng nhập đầy đủ thông tin"));
    } else if (credentials['username'] == username && credentials['password'] == password) {
      emit(state.success());
    } else {
      emit(state.failure("Sai tên đăng nhập hoặc mật khẩu"));
    }
  }
}