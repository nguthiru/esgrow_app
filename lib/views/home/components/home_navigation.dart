import 'package:esgrow/components/bottom_navigation_item.dart';
import 'package:esgrow/constants/spacings.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar(
      {super.key,
      required this.activeIndex,
      required this.onTap,
      this.height = kBottomNavigationBarHeight});
  final int activeIndex;
  final Function(int index) onTap;
  final double height;

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 2, vertical: defaultPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavigationItem(
            icon: const Icon(Icons.home_mini_outlined),
            text: "Home",
            isActive: widget.activeIndex == 0,
            onTap: () => widget.onTap(0),
          ),
          BottomNavigationItem(
              icon: const Icon(Icons.history_outlined),
              text: "History",
              isActive: widget.activeIndex == 1,
              onTap: () => widget.onTap(1)),
          BottomNavigationMainItem(
            onTap: () => widget.onTap(2),
            isActive: widget.activeIndex == 2,
          ),
          BottomNavigationItem(
              icon: const Icon(Icons.wallet_outlined),
              text: "Accounts",
              isActive: widget.activeIndex == 3,
              onTap: () => widget.onTap(3)),
          BottomNavigationItem(
              icon: const Icon(Icons.person_2_outlined),
              text: "Profile",
              isActive: widget.activeIndex == 4,
              onTap: () => widget.onTap(4)),
        ],
      ),
    );
  }
}
