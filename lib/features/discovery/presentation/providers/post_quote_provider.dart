import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/quote/quote.dart';
import 'package:quote_generator/features/profile/presentation/presentation.dart';

final postQuoteProvider = FutureProviderFamily(
  (ref, Quote quote) async {
    final postQuote = ref.read(postQuoteUseCaseProvider);
    final user = ref.watch(userProvider);
    final userId = user.appUser?.userId;
    final remoteQuote = RemoteQuoteMapper.fromLocalToRemoteQuote(
      quote,
      '$userId',
    );
    return await postQuote(remoteQuote);
  },
);
