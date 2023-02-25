import 'package:flutter/material.dart';
import 'package:quote_generator/theme/dimensions.dart';

class EmptyQuoteCard extends StatefulWidget {
  const EmptyQuoteCard({
    super.key,
    required this.displayText,
    required this.displayIcon,
  });
  final String displayText;
  final IconData displayIcon;

  @override
  State<EmptyQuoteCard> createState() => _EmptyQuoteCardState();
}

class _EmptyQuoteCardState extends State<EmptyQuoteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
    return Card(
      color: theme.colorScheme.secondary,
      child: Padding(
        padding: Dimensions.kPaddingAllLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                widget.displayIcon,
                size: Dimensions.iconSizeLargest,
              ),
            ),
            Dimensions.kVerticalSpaceSmall,
            Text(
              widget.displayText,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
