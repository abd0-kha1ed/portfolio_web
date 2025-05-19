import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';

class HomeSnippetsSection extends StatelessWidget {
  const HomeSnippetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Code Snippet',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 32),

          // ✅ كروت Snippets
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: const [
              _SnippetCard(
                title: 'Flutter Auth Starter',
                description: 'Basic login/register flow with Cubit and Firebase.',
                stars: 12,
                icons: [Icons.flutter_dash, Icons.lock],
              ),
              _SnippetCard(
                title: 'Clean Architecture Template',
                description: 'Base Flutter project with layered clean structure.',
                stars: 8,
                icons: [Icons.architecture, Icons.layers],
              ),
              _SnippetCard(
                title: 'Adaptive Layout Scaffold',
                description: 'Responsive layout using MediaQuery & LayoutBuilder.',
                stars: 6,
                icons: [Icons.devices, Icons.view_compact],
              ),
              _SnippetCard(
                title: 'Cubit HTTP Example',
                description: 'API integration using Dio + Cubit pattern.',
                stars: 10,
                icons: [Icons.api, Icons.send],
              ),
            ],
          ),

          const SizedBox(height: 32),

          // ✅ زر See More
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton.icon(
              onPressed: () {
                // سنتعامل معها لاحقًا
              },
              icon: const Icon(Icons.menu),
              label: const Text('See More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.background,
                foregroundColor: AppColors.white,
                side: const BorderSide(color: AppColors.secondaryText),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SnippetCard extends StatelessWidget {
  final String title;
  final String description;
  final int stars;
  final List<IconData> icons;

  const _SnippetCard({
    required this.title,
    required this.description,
    required this.stars,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
                height: 1.5,
              )),
          const SizedBox(height: 16),
          Row(
            children: [
              ...icons.map(
                (icon) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(icon, color: AppColors.accent, size: 20),
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text('$stars Stars',
                  style: const TextStyle(
                      color: AppColors.secondaryText, fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
