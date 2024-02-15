import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'navigation_botton_state.dart';

class AllPagesCubit extends Cubit<AllPagesState> {
  AllPagesCubit() : super(AllPagesState.intial());
  void changeButton(int index) {
    emit(state.copyWith(
      currentIndex: index,
      status: AllPagesStatus.changeBottonNavigation,
    ));
  }
}
