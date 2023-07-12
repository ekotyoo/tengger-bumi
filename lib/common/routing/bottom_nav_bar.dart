import 'package:flutter/material.dart';

import '../constants/constant.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(SWSizes.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BottomNavItem(
            icon: Icons.home,
            label: 'Beranda',
            onPressed: () => onTap(0),
            selected: currentIndex == 0,
          ),
          BottomNavItem(
            icon: Icons.map_rounded,
            label: 'Peta',
            onPressed: () => onTap(1),
            selected: currentIndex == 1,
          ),
          FloatingActionButton.small(
            onPressed: () => onTap(2),
            child: const Icon(Icons.add_rounded),
          ),
          BottomNavItem(
            icon: Icons.list,
            label: 'Sekolah',
            onPressed: () => onTap(3),
            selected: currentIndex == 3,
          ),
          BottomNavItem(
            icon: Icons.person,
            label: 'Profil',
            onPressed: () => onTap(4),
            selected: currentIndex == 4,
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.selected = false,
    this.selectedColor,
    this.unselectedColor,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onPressed;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  Widget build(BuildContext context) {
    final currentSelectedColor =
        selectedColor ?? Theme.of(context).primaryColor;
    final currentUnselectedColor = unselectedColor ?? kColorNeutral50;

    final color = selected ? currentSelectedColor : currentUnselectedColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        color: Colors.transparent,
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(height: SWSizes.s8),
            Text(
              label,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
