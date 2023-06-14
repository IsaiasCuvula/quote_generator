// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/shared/shared.dart';

class QuoteState extends Equatable {
  final QuoteList allQuotes;
  final QuoteList favoritesQuotes;
  final QuoteList searcherdQuotes;
  final Quote? quote;
  final String message;
  final bool isLoading;

  const QuoteState(
    this.allQuotes,
    this.favoritesQuotes,
    this.searcherdQuotes,
    this.quote,
    this.isLoading,
    this.message,
  );

  const QuoteState.initial({
    this.allQuotes = const [],
    this.favoritesQuotes = const [],
    this.searcherdQuotes = const [],
    this.quote,
    this.isLoading = false,
    this.message = '',
  });

  @override
  List<Object> get props {
    return [
      allQuotes,
      favoritesQuotes,
      searcherdQuotes,
      quote!,
      message,
      isLoading,
    ];
  }

  QuoteState copyWith({
    QuoteList? allQuotes,
    QuoteList? favoritesQuotes,
    QuoteList? searcherdQuotes,
    Quote? quote,
    String? message,
    bool? isLoading,
  }) {
    return QuoteState(
      allQuotes ?? this.allQuotes,
      favoritesQuotes ?? this.favoritesQuotes,
      searcherdQuotes ?? this.searcherdQuotes,
      quote ?? this.quote,
      isLoading ?? this.isLoading,
      message ?? this.message,
    );
  }

  @override
  bool get stringify => true;
}
