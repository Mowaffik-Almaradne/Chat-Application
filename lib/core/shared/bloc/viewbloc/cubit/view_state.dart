import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';


class ViewState extends Equatable {
  final ViewPageChange changeView;
  const ViewState({required this.changeView});

  factory ViewState.inital() {
    return const ViewState(
      changeView: ViewPageChange.searchPartner,
    );
  }
  @override
  List<Object?> get props => [changeView];

  ViewState copyWith({ViewPageChange? changeView}) {
    return ViewState(
      changeView: changeView ?? this.changeView,
    );
  }
}
