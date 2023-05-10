import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quote_generator/config/theme/dimensions.dart';

class EmptyQuoteCard extends StatelessWidget {
  const EmptyQuoteCard({
    Key? key,
    required this.displayText,
    required this.displayIcon,
  }) : super(key: key);

  final String displayText;
  final IconData displayIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Container(
      height: Dimensions.kScreenHeight30,
      width: Dimensions.kScreenWidth60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.primary, colors.secondary],
        ),
        borderRadius: Dimensions.kBorderRadiusAllMedium,
      ),
      child: Padding(
        padding: Dimensions.kPaddingAllLarge,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Icon(
                  displayIcon,
                  color: theme.colorScheme.onSurface,
                  size: Dimensions.iconSizeLarge,
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .scale(
                      duration: 3.seconds,
                      curve: Curves.easeInOut,
                    ),
              ),
              Dimensions.kVerticalSpaceSmall,
              Expanded(
                flex: 2,
                child: Text(
                  displayText,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ]),
      ),
    ).animate().scale(
          duration: 3.seconds,
          curve: Curves.easeInOut,
        );
  }
}
