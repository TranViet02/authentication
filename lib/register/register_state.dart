class RegisterState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  RegisterState({
    required this.isLoading,
    required this.isSuccess,
    required this.errorMessage,
  });

   factory RegisterState.initial() {
    return RegisterState(
      isLoading: false,
      isSuccess: false,
      errorMessage: '',
    );
  }

  RegisterState loading() {
    return RegisterState(
      isLoading: true,
      isSuccess: false,
      errorMessage: '',
    );
  }

  RegisterState success() {
    return RegisterState(
      isLoading: false,
      isSuccess: true,
      errorMessage: '',
    );
  }

  RegisterState failure(String errorMessage) {
    return RegisterState(
      isLoading: false,
      isSuccess: false,
      errorMessage: errorMessage,
    );
  }
}