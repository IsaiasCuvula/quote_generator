import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/shared/shared.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}
