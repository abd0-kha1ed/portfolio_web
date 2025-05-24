import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.onNavItemClick,
    required this.selectedItem,
  });
  final void Function(String section) onNavItemClick;
  final String selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText('Abd El-Rhman', style: AppTextStyles.bold24),
          Row(
            children: [
              SwitchItem(
                title: 'What I Do',
                isSelected: selectedItem == 'What I Do',
                onTap: () => onNavItemClick('What I Do'),
              ),

              SwitchItem(
                title: 'Portfolio',
                isSelected: selectedItem == 'Portfolio',
                onTap: () => onNavItemClick('Portfolio'),
              ),
              SwitchItem(
                title: 'Snippets',
                isSelected: selectedItem == 'Snippets',
                onTap: () => onNavItemClick('Snippets'),
              ),

              SwitchItem(
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

class SwitchItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SwitchItem({
    super.key,
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
        child: SelectableText(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? AppColors.white : AppColors.secondaryText,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
