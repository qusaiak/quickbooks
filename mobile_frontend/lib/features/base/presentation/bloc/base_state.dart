part of 'base_bloc.dart';

enum BaseStatus {
  initial,
  changeBottomNavBarIndex,
  controlBottomNavBar,
}

class BaseState extends Equatable {
  final BaseStatus? baseStatus;
  final bool? isShown;
  final int? currentIndex;

  const BaseState({
    this.baseStatus,
    this.isShown,
    this.currentIndex,
  });

  BaseState copyWith({
    BaseStatus? baseStatus,
    bool? isShown,
    int? currentIndex,
  }) =>
      BaseState(
        baseStatus: baseStatus ?? this.baseStatus,
        isShown: isShown ?? this.isShown,
        currentIndex: currentIndex ?? this.currentIndex,
      );

  @override
  List<Object?> get props => [
        baseStatus,
        isShown,
        currentIndex,
      ];
}
