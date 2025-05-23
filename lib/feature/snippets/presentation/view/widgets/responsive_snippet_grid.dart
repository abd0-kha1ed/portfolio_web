import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/home/presentation/view/widgets/home_snippets_section.dart';
import 'package:portfolio_web/feature/snippets/data/model/snippet_model.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippet_code_dialog.dart';

class ResponsiveSnippetGrid extends StatelessWidget {
  final List<SnippetModel> snippets;

  const ResponsiveSnippetGrid({super.key, required this.snippets});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount =
        width > 1200
            ? 3
            : width > 800
            ? 2
            : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: snippets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (context, index) {
        final snippet = snippets[index];
        return GestureDetector(
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
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 500),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder:
                (context, value, child) => Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                ),
            child: SnippetCard(
              title: snippet.title,
              description: snippet.description,
              stars: snippet.stars,
              icons: snippet.icons,
            ),
          ),
        );
      },
    );
  }
}
