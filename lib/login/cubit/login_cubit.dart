import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  onChangeUsername(String username) {
    emit(state.copyWith(username: username));
  }

  onChangePassword(String password) {
    emit(state.copyWith(password: password));
  }
}
