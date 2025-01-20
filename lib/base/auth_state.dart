class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final String errorMessage;

  AuthState({
    required this.isLoading,
    required this.isSuccess,
    required this.errorMessage,
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      isSuccess: false,
      errorMessage: '',
    );
  }

  AuthState loading() {
    return AuthState(
      isLoading: true,
      isSuccess: false,
      errorMessage: '',
    );
  }

  AuthState success() {
    return AuthState(
      isLoading: false,
      isSuccess: true,
      errorMessage: '',
    );
  }

  AuthState failure(String errorMessage) {
    return AuthState(
      isLoading: false,
      isSuccess: false,
      errorMessage: errorMessage,
    );
  }

   AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
   
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
