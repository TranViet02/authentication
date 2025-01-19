class HomeState {
  final Duration remainingTime;
  final bool isRunning; 

  HomeState({
    required this.remainingTime,
    required this.isRunning,
  });

  HomeState copyWith({
    Duration? remainingTime,
    bool? isRunning,
  }) {
    return HomeState(
      remainingTime: remainingTime ?? this.remainingTime,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}