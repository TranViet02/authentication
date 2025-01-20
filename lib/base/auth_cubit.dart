import 'package:authendication_app/base/account.dart';
import 'package:authendication_app/base/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  String userName = '';
  
  String passWord = '';

  void updateUsername(String value) {
    userName = value.trim();
     emit(state.copyWith());
  }

  void updatePassword(String value) {
    passWord = value.trim();
     emit(state.copyWith());
  }

  Future<void> register() async {
    emit(state.loading());
    final existingCredentials = await Account.getUserCredentials();

    if (userName.isEmpty || passWord.isEmpty) {
      emit(state.failure("Vui lòng nhập đầy đủ thông tin"));
    } else if (existingCredentials['username'] == userName) {
      emit(state.failure("Tên đăng nhập đã tồn tại"));
    } else {
      await Account.saveUserCredentials(userName, passWord);
      emit(state.success());
    }
  }

  Future<void> login() async {
    emit(state.loading());
    final credentials = await Account.getUserCredentials();

    if (userName.isEmpty || passWord.isEmpty) {
      emit(state.failure("Vui lòng nhập đầy đủ thông tin"));
    } else if (credentials['username'] == userName && credentials['password'] == passWord) {
      emit(state.success());
    } else {
      emit(state.failure("Sai tên đăng nhập hoặc mật khẩu"));
    }
  }
}