
import 'package:authendication_app/account.dart';
import 'package:authendication_app/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterState.initial());

    void register( String username, String password) async {
      emit(state.loading());
      final existingCredentials = await Account.getUserCredentials();
      if (existingCredentials['username'] == username) {
        emit(state.failure("Tên đăng nhập đã tồn tại"));
      }
      await Account.saveUserCredentials(username, password);
      emit(state.success());
  }
}