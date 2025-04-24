import 'package:flutter/material.dart';
import '../theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final int itemCount;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 360,
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: theme.primary90,
        borderRadius: BorderRadius.circular(8),
        boxShadow: _buildBoxShadow(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(itemCount, (index) {
          final isActive = index == selectedIndex;
          return _NavItem(
            icon: _getIcon(index),
            isActive: isActive,
            activeColor: theme.primary05,
            inactiveColor: theme.primary30.withOpacity(0.6),
            onTap: () => onItemTapped(index),
          );
        }),
      ),
    );
  }

  List<BoxShadow> _buildBoxShadow() => [
    BoxShadow(
      color: Colors.black.withOpacity(0.14),
      blurRadius: 8,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 3,
      offset: const Offset(0, 3),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 5,
      offset: const Offset(0, 5),
    ),
  ];

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.favorite;
      case 1:
        return Icons.search;
      case 2:
        return Icons.info;
      case 3:
        return Icons.notifications;
      case 4:
        return Icons.settings;
      default:
        return Icons.error;
    }
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? activeColor : inactiveColor, size: 24),
          const SizedBox(height: 4),
          if (isActive) Container(width: 24, height: 2, color: activeColor),
        ],
      ),
    );
  }
}
