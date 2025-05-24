import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/core/constants/all_snippets_list.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/routing/app_router.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippet_code_dialog.dart';
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
                const SelectableText(
                  'Code Snippet',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 32),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final crossAxisCount =
                        width > 1100
                            ? 4
                            : width > 800
                            ? 2
                            : 1;

                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 1.4,
                      children:
                          allSnippets
                              .take(4)
                              .map(
                                (snippet) => GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (_) => SnippetCodeDialog(
                                            title: snippet.title,
                                            code: snippet.code,
                                          ),
                                    );
                                  },
                                  child: SnippetCard(
                                    title: snippet.title,
                                    description: snippet.description,
                                    stars: snippet.stars,
                                    icons: snippet.icons,
                                  ),
                                ),
                              )
                              .toList(),
                    );
                  },
                ),

                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSnippets);
                    },
                    icon: Icon(Icons.menu),
                    label: Text('See More'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.white,
                      side: const BorderSide(color: AppColors.secondaryText),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                  ),
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

class SnippetCard extends StatelessWidget {
  final String title;
  final String description;
  final int stars;
  final List<IconData> icons;

  const SnippetCard({
    super.key,
    required this.title,
    required this.description,
    required this.stars,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.backgroundCards,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              description,
              style: const TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const Spacer(),
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
                SelectableText(
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
      ),
    );
  }
}
