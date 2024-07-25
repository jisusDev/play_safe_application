class TimerModel {
  final int duration;
  int remainingTime;

  TimerModel({required this.duration, required this.remainingTime});

  TimerModel copyWith({int? duration, int? remainingTime}) {
    return TimerModel(
      duration: duration ?? this.duration,
      remainingTime: remainingTime ?? this.remainingTime,
    );
  }
}



