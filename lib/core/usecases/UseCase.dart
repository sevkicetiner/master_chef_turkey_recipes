

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:master_chef_yemek_tarifleri/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}