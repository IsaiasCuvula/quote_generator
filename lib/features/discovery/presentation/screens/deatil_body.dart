import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/config/config.dart';
import 'package:quote_generator/core/core.dart';
import 'package:quote_generator/features/features.dart';

class DetailBody extends ConsumerWidget {
  const DetailBody({
    super.key,
    required this.quote,
  });

  final RemoteQuote quote;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final userId = user.appUser?.userId;
    final textColor = context.colorScheme.onSurface;

    const displayFavoriteIcon = FontAwesomeIcons.heart;
    return Container(
      margin: Dimensions.kPaddingAllLarge,
      padding: Dimensions.kPaddingAllLarge,
      decoration: BoxDecoration(
        color: Color(quote.backgroundColor),
        borderRadius: Dimensions.kBorderRadiusAllLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.quoteLeft,
            size: Dimensions.iconSizeLarge,
            color: textColor,
          ),
          Dimensions.kVerticalSpaceSmall,
          Text(
            quote.quoteText,
            textAlign: AppHelpers.textAlignList[quote.textAlign],
            style: TextStyle(
              color: textColor,
              fontSize: quote.fontSize,
              fontWeight: AppHelpers.fontWeightList[quote.fontWeight],
              wordSpacing: quote.wordSpacing,
              letterSpacing: quote.letterSpacing,
            ),
          ),
          Dimensions.kVerticalSpaceSmall,
          Text(
            '- ${quote.author}',
            textAlign: AppHelpers.textAlignList[quote.textAlign],
            style: context.textTheme.bodyMedium?.copyWith(
              color: textColor,
            ),
          ),
          Dimensions.kVerticalSpaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  displayFavoriteIcon,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.shareNodes,
                  size: Dimensions.iconSizeLarge,
                ),
                color: textColor,
                onPressed: () async {
                  final quoteText = quote.quoteText;
                  final quoteAuthor = quote.author;
                  await AppHelpers.shareQuote(
                    quoteText,
                    quoteAuthor,
                  );
                },
              ),
              if (userId == quote.userId)
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.trashCan,
                    size: Dimensions.iconSizeLarge,
                  ),
                  color: textColor,
                  onPressed: () async {
                    ref.read(deleteRemoteQuoteProvider(quote));
                    context.pop();
                  },
                ),
            ],
          ),
        ].animate().slide().then().shake(),
      ),
    );
  }
}
