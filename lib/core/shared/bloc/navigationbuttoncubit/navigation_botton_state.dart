part of 'navigation_button_cubit.dart';

enum AllPagesStatus {
  changeBottonNavigation,
  intial,
}

class AllPagesState extends Equatable {
  final int currentIndex;
  final AllPagesStatus status;

  const AllPagesState({
    required this.currentIndex,
    required this.status,
  });

  factory AllPagesState.intial() {
    return const AllPagesState(
      currentIndex: 0,
      status: AllPagesStatus.intial,
    );
  }
  @override
  List<Object?> get props => [currentIndex];

  AllPagesState copyWith({
    int? currentIndex,
    AllPagesStatus? status,
  }) {
    return AllPagesState(
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }
}
