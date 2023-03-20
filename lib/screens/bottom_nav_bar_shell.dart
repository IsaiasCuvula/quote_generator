import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/theme/dimensions.dart';
import 'package:quote_generator/widgets/widgets.dart';

class BottomNavBarShell extends StatelessWidget {
  static BottomNavBarShell builder(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      BottomNavBarShell(
        currentRoute: state.location,
        child: child,
      );

  const BottomNavBarShell({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  final Widget child;
  final String currentRoute;

  bool _isItemSelected(String route) {
    return currentRoute.startsWith(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          child,
          Padding(
            padding: const EdgeInsets.only(bottom: 0).w,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(
                items: [
                  BottomNavBarItem(
                    child: _BottomNavBarIcon(
                      displayIcon: FontAwesomeIcons.house,
                      isSelected: _isItemSelected('/home'),
                    ),
                    onTap: () => context.go('/home'),
                  ),
                  BottomNavBarItem(
                    child: const _AddQuoteButtom(),
                    onTap: () => context.go('/createQuote'),
                  ),
                  BottomNavBarItem(
                    child: _BottomNavBarIcon(
                      displayIcon: FontAwesomeIcons.magnifyingGlass,
                      isSelected: _isItemSelected('/search'),
                    ),
                    onTap: () => context.go('/search'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddQuoteButtom extends StatelessWidget {
  const _AddQuoteButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color displayIconColor = colorScheme.surface;
    return Card(
      color: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: Dimensions.kBorderRadiusAllLarge,
      ),
      child: Padding(
        padding: Dimensions.kPaddingAllSmall,
        child: Center(
          child: Icon(
            Icons.add_sharp,
            size: Dimensions.iconSizeMedium,
            color: displayIconColor,
          ),
        ),
      ),
    );
  }
}

class _BottomNavBarIcon extends StatelessWidget {
  const _BottomNavBarIcon({
    Key? key,
    required this.displayIcon,
    required this.isSelected,
  }) : super(key: key);

  final IconData displayIcon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color displayIconColor =
        isSelected ? colorScheme.primary : colorScheme.secondary;
    return Icon(
      displayIcon,
      size: Dimensions.iconSizeMedium,
      color: displayIconColor,
    );
  }
}
