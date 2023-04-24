import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/translations/l10n.dart';

class EmptySearchQuoteScreen extends StatelessWidget {
  const EmptySearchQuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            size: Dimensions.iconSizeLarger,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .scale(
                duration: 3.seconds,
                curve: Curves.elasticInOut,
              ),
          Dimensions.kVerticalSpaceSmall,
          Text(
            context.l10n.search_quote_empty_screen_title,
            style: theme.textTheme.headlineSmall,
          ),
          Dimensions.kVerticalSpaceSmallest,
          Text(
            context.l10n.search_quote_empty_screen_descritpion,
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
