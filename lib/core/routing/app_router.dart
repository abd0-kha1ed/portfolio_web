import 'package:go_router/go_router.dart';
import 'package:portfolio_web/feature/about_me/presentation/view/about_me_view.dart';
import 'package:portfolio_web/feature/contact_section/presentation/view/contact_view.dart';
import 'package:portfolio_web/feature/home/presentation/view/home_view.dart';
import 'package:portfolio_web/feature/projects/presentation/view/project_view.dart';
import 'package:portfolio_web/feature/snippets/presentation/view/code_snippet_view.dart';

abstract class AppRouter {
  static const String kHome = '/';
  static const String kProjects = '/projects';
  static const String kSnippets = '/snippets';
  static const String kAbout = '/about';
  static const String kContact = '/contact';
  static final router = GoRouter(
    initialLocation: kHome,
    routes: [
      GoRoute(
        path: kHome,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(path: kProjects, builder: (context, state) => ProjectsView()),
      GoRoute(path: kSnippets, builder: (context, state) => CodeSnippetView()),
      GoRoute(path: kAbout, builder: (context, state) => const AboutMeView()),
      GoRoute(path: kContact, builder: (context, state) => const ContactView()),
    ],
  );
}
