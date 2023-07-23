import 'package:dartz/dartz.dart';
import 'package:quote_generator/features/download/download.dart';
import 'package:quote_generator/core/core.dart';

class SaveImageUseCase implements UseCase<dynamic, QuoteImage> {
  final DownloadRepository _repository;

  SaveImageUseCase(this._repository);
  @override
  Future<Either<Failure, dynamic>> call(QuoteImage image) async {
    return await _repository.saveQuoteImageToDevice(image);
  }
}
