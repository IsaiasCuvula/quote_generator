import 'package:flutter/material.dart';
import 'package:quote_generator/config/theme/dimensions.dart';

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
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [colors.primary, colors.secondary],
                    ),
                    borderRadius: Dimensions.kBorderRadiusAllMedium,
                  ),
                  width: 150,
                  height: 150,
                  child: Padding(
                    padding: Dimensions.kPaddingAllLarge,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ScaleTransition(
                            scale: _controller,
                            child: Icon(
                              widget.displayIcon,
                              color: theme.colorScheme.tertiaryContainer,
                              size: Dimensions.iconSizeLarge,
                            ),
                          ),
                        ),
                        Dimensions.kVerticalSpaceSmall,
                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.displayText,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
