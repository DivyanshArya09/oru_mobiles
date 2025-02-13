part of 'filter_bloc.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

final class FilterInitial extends FilterState {}

final class FilterLoading extends FilterState {}

final class FilterError extends FilterState {
  final String message;
  const FilterError({required this.message});
}

final class FilterLoaded extends FilterState {
  final List<FilterResponseModel> filters;
  const FilterLoaded({required this.filters});
}

final class Trying extends FilterState {}

final class Success extends FilterState {}
