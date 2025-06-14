
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc()
      : super(const BaseState().copyWith(
          baseStatus: BaseStatus.initial,
          isShown: true,
          currentIndex: 0,
        )) {
    on<ChangeBottomNavBarIndex>(onChangeBottomNavBarIndex);
    on<ControlBottomNavbarVisibility>(onControlBottomNavbarVisibility);
  }

  void onChangeBottomNavBarIndex(
      ChangeBottomNavBarIndex event, Emitter<BaseState> emit) async {
    emit(state.copyWith(
        baseStatus: BaseStatus.changeBottomNavBarIndex,
        currentIndex: event.newIndex));
  }

  void onControlBottomNavbarVisibility(
      ControlBottomNavbarVisibility event, Emitter<BaseState> emit) async {
    emit(state.copyWith(
        baseStatus: BaseStatus.controlBottomNavBar, isShown: event.isShown));
  }
}
