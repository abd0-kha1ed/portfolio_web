import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app-text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Abdelrahman',
            style: AppTextStyles.name,
          ),
          Row(
            children: const [
              _NavItem(title: 'Home'),
              _NavItem(title: 'Projects'),
              _NavItem(title: 'Snippets'),
              _NavItem(title: 'Mentorship'),
              _NavItem(title: 'Contact'),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;

  const _NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: AppTextStyles.navItem,
      ),
    );
  }
}
