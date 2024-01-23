import 'package:esgrow/constants/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.isActive = false});
  final Widget icon;
  final String text;
  final Function onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => onTap(),
            icon: icon,
            // iconSize: 20,
            color: isActive ? Colors.white : Colors.grey,
          ),
          isActive
              ? Text(text,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class BottomNavigationMainItem extends StatelessWidget {
  const BottomNavigationMainItem(
      {super.key, this.isActive = false, required this.onTap});
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isActive ? 65 : 60,
        height: isActive ? 65 : 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? primaryColor : null,
            border: !isActive ? Border.all(color: Colors.grey) : null),
        child: Icon(
          Icons.currency_exchange,
          color: Colors.white,
        ),
      ),
    );
  }
}
