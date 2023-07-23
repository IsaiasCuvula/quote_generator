import 'package:dartz/dartz.dart';
import 'package:quote_generator/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
