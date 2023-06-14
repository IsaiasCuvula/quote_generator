import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class GetQuoteByIdNotifier extends StateNotifier<QuoteState> {
  GetQuoteByIdNotifier(this._getQuoteById) : super(const QuoteState.initial());

  final GetQuoteById _getQuoteById;

  Future<void> getQuoteById(int id) async {
    state = state.copyWith(isLoading: true);
    final result = await _getQuoteById(id);
    state = result.fold(
      (failure) => state.copyWith(
        message: failure.message,
        isLoading: false,
      ),
      (quote) => state.copyWith(
        isLoading: false,
        quote: quote,
      ),
    );
  }
}
