import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/all_snippets_list.dart';
import 'package:portfolio_web/feature/snippets/data/model/snippet_model.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/responsive_snippet_grid.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippets_header_section.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/widgets/snippets_search_field.dart';

class MobileSnippets extends StatelessWidget {
  const MobileSnippets({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MobileSnippetsBody());
  }
}

class MobileSnippetsBody extends StatefulWidget {
  const MobileSnippetsBody({super.key});

  @override
  State<MobileSnippetsBody> createState() => _MobileSnippetsBodyState();
}

class _MobileSnippetsBodyState extends State<MobileSnippetsBody> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SnippetsHeaderSection(),
            SnippetsSearchField(
              searchController: _searchController,
              onChanged: (_) {},
            ),
            const SizedBox(height: 40),
            ResponsiveSnippetGrid(snippets: filteredSnippets),
          ],
        ),
      ),
    );
  }
}
