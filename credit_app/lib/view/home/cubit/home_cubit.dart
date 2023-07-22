import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(isShow: false));

  void toogleIsShow() {
    emit(state.copyWith(isShow: !state.isShow));
  }
}
