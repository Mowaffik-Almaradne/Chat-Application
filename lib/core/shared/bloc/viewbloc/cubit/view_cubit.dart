import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
class ViewCubit extends Cubit<ViewState> {
  ViewCubit() : super(ViewState.inital());

  void changeViewPage(ViewPageChange viewPage) {
    emit(state.copyWith(changeView: viewPage));
  }
}
