import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:oru_mobiles/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params entity);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
