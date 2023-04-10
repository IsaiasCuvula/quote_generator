import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_generator/config/theme/theme.dart';
import 'package:quote_generator/translations/l10n.dart';

class EmptySearchQuoteScreen extends StatefulWidget {
  const EmptySearchQuoteScreen({super.key});

  @override
  State<EmptySearchQuoteScreen> createState() => _EmptySearchQuoteScreenState();
}

class _EmptySearchQuoteScreenState extends State<EmptySearchQuoteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: Dimensions.iconSizeLarger,
            ),
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
