import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function(String section) onNavItemClick;
  final String selectedItem;

  const CustomAppBar({
    super.key,
    required this.onNavItemClick,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Abdelrahman', style: AppTextStyles.name),
          Row(
            children: [
              NavItem(
                title: 'Home',
                isSelected: selectedItem == 'Home',
                onTap: () => onNavItemClick('Home'),
              ),
              NavItem(
                title: 'Projects',
                isSelected: selectedItem == 'Projects',
                onTap: () => onNavItemClick('Projects'),
              ),
              NavItem(
                title: 'Snippets',
                isSelected: selectedItem == 'Snippets',
                onTap: () => onNavItemClick('Snippets'),
              ),
              NavItem(
                title: 'Mentorship',
                isSelected: selectedItem == 'Mentorship',
                onTap: () => onNavItemClick('Mentorship'),
              ),
              NavItem(
                title: 'Contact',
                isSelected: selectedItem == 'Contact',
                onTap: () => onNavItemClick('Contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({super.key, 
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? AppColors.accent : AppColors.secondaryText,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
