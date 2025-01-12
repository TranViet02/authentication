class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  LoginState({
    required this.isLoading,
    required this.isSuccess,
    required this.errorMessage,
  });

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      isSuccess: false,
      errorMessage: '',
    );
  }

  LoginState loading() {
    return LoginState(
      isLoading: true,
      isSuccess: false,
      errorMessage: '',
    );
  }

  LoginState success() {
    return LoginState(
      isLoading: false,
      isSuccess: true,
      errorMessage: '',
    );
  }

  LoginState failure(String errorMessage) {
    return LoginState(
      isLoading: false,
      isSuccess: false,
      errorMessage: errorMessage,
    );
  }
}
