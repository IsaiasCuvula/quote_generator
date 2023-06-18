import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:quote_generator/common/common.dart';

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
              child: Container(
                margin: Dimensions.kPaddingAllLargest,
                child: BottomNavBar(
                  items: [
                    BottomNavBarItem(
                      child: BottomNavBarIcon(
                        selectedIcon: FontAwesomeIcons.pencil,
                        unselectedIcon: FontAwesomeIcons.pencil,
                        isSelected: _isItemSelected(RouteLocation.createdByYou),
                      ),
                      onTap: () => context.go(RouteLocation.createdByYou),
                    ),
                    BottomNavBarItem(
                      child: BottomNavBarIcon(
                        selectedIcon: FontAwesomeIcons.solidCompass,
                        unselectedIcon: FontAwesomeIcons.compass,
                        isSelected: _isItemSelected(RouteLocation.discovery),
                      ),
                      onTap: () => context.go(RouteLocation.discovery),
                    ),
                    BottomNavBarItem(
                      child: BottomNavBarIcon(
                        selectedIcon: FontAwesomeIcons.magnifyingGlass,
                        unselectedIcon: FontAwesomeIcons.magnifyingGlass,
                        isSelected: _isItemSelected(RouteLocation.search),
                      ),
                      onTap: () => context.go(RouteLocation.search),
                    ),
                    BottomNavBarItem(
                      child: BottomNavBarIcon(
                        selectedIcon: FontAwesomeIcons.solidHeart,
                        unselectedIcon: FontAwesomeIcons.heart,
                        isSelected: _isItemSelected(RouteLocation.favorites),
                      ),
                      onTap: () => context.go(RouteLocation.favorites),
                    ),
                    BottomNavBarItem(
                      child: BottomNavBarIcon(
                        selectedIcon: FontAwesomeIcons.gear,
                        unselectedIcon: FontAwesomeIcons.gear,
                        isSelected: _isItemSelected(RouteLocation.settings),
                      ),
                      onTap: () => context.go(RouteLocation.settings),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
