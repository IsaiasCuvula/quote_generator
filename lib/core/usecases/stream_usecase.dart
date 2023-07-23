import 'package:dartz/dartz.dart';
import 'package:quote_generator/core/core.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
