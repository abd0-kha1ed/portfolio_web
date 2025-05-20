import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeSnippetsSection extends StatefulWidget {
  const HomeSnippetsSection({super.key});

  @override
  State<HomeSnippetsSection> createState() => _HomeSnippetsSectionState();
}

class _HomeSnippetsSectionState extends State<HomeSnippetsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.25 && !_isVisible) {
      _controller.forward();
      _isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('snippet-section'),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _offsetAnimation,
        child: FadeTransition(
          opacity: _controller,
          child: Container(
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
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: const [
                    _SnippetCard(
                      title: 'Flutter Auth Starter',
                      description:
                          'Basic login/register flow with Cubit and Firebase.',
                      stars: 12,
                      icons: [Icons.flutter_dash, Icons.lock],
                    ),
                    _SnippetCard(
                      title: 'Clean Architecture Template',
                      description:
                          'Base Flutter project with layered clean structure.',
                      stars: 8,
                      icons: [Icons.architecture, Icons.layers],
                    ),
                    _SnippetCard(
                      title: 'Adaptive Layout Scaffold',
                      description:
                          'Responsive layout using MediaQuery & LayoutBuilder.',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.secondaryText,
              fontSize: 14,
              height: 1.5,
            ),
          ),
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
              Text(
                '$stars Stars',
                style: const TextStyle(
                  color: AppColors.secondaryText,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
