part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({this.password = "", this.username = "user"});

  final String username;
  final String password;

  LoginState copyWith({String? username, String? password}) {
    return LoginState(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
