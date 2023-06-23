import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quote_generator/common/common.dart';
import 'package:quote_generator/features/discovery/discovery.dart';
import 'package:quote_generator/features/discovery/presentation/providers/get_user_info_provider.dart';
import 'package:quote_generator/features/shared/widgets/display_message_card.dart';
import 'package:quote_generator/features/shared/widgets/widgets.dart';

class RemoteCardHeader extends ConsumerWidget {
  const RemoteCardHeader({super.key, required this.quote});

  final RemoteQuote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoProvider(quote.userId));
    return userInfo.when(
      data: (userInfo) {
        return Container(
          height: Dimensions.kQuoteCardFooterHigh,
          padding: Dimensions.kPaddingAllSmall,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimensions.kHorizontalSpaceLarge,
              Text(
                userInfo.displayName,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: context.colorScheme.tertiaryContainer,
                ),
              ),
              Dimensions.kHorizontalSpaceLarge,
            ],
          ),
        );
      },
      error: (error, stackTrace) => DisplayErrorMessage(
        message: error.toString(),
      ),
      loading: () => const LoadingScreen(),
    );
  }
}
