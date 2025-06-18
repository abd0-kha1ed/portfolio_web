import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_web/core/constants/all_snippets_list.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/constants/helper.dart';
import 'package:portfolio_web/core/routing/app_router.dart';
import 'package:portfolio_web/core/widgets/custom_footer.dart';
import 'package:portfolio_web/core/widgets/custom_header.dart';
import 'package:portfolio_web/feature/home/presentation/view/mobile_snippits.dart';
import 'package:portfolio_web/feature/snippets/data/model/snippet_model.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/responsive_snippet_grid.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippets_header_section.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippets_search_field.dart';

class CodeSnippetsViewBody extends StatefulWidget {
  const CodeSnippetsViewBody({super.key});

  @override
  State<CodeSnippetsViewBody> createState() => _CodeSnippetsViewBodyState();
}

class _CodeSnippetsViewBodyState extends State<CodeSnippetsViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String selectedItem = 'Snippets';
  List<SnippetModel> filteredSnippets = allSnippets;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredSnippets =
          allSnippets.where((snippet) {
            return snippet.title.toLowerCase().contains(query) ||
                snippet.description.toLowerCase().contains(query);
          }).toList();
    });
  }

  void onNavItemClick(String section) {
    setState(() => selectedItem = section);

    if (section == 'What I Do') {
      GoRouter.of(context).push(AppRouter.kAbout);
    } else if (section == 'Portfolio') {
      GoRouter.of(context).push(AppRouter.kProjects);
    } else if (section == 'Contact') {
      GoRouter.of(context).push(AppRouter.kContact);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder:
          (context, constrains) =>
              constrains.maxWidth < 800
                  ? MobileSnippets()
                  : buildSnippetsDesktopLayout(width),
    );
  }

  SingleChildScrollView buildSnippetsDesktopLayout(double width) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              onNavItemClick: onNavItemClick,
              selectedItem: selectedItem,
            ),
            const Divider(color: AppColors.normalText),
            const SizedBox(height: 78),
            const SnippetsHeaderSection(),
            SnippetsSearchField(
              searchController: _searchController,
              onChanged: (_) {},
            ),
            const SizedBox(height: 40),
            ResponsiveSnippetGrid(snippets: filteredSnippets),
            const SizedBox(height: 80),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
