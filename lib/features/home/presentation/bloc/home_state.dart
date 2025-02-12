part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});
}

final class HomeLoadedState extends HomeState {
  final List<MobileBrandModel> mobileBrands;
  const HomeLoadedState({required this.mobileBrands});
}
