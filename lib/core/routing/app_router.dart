import 'package:go_router/go_router.dart';
import 'package:portfolio_web/feature/home/presentation/view/home_view.dart';
import 'package:portfolio_web/feature/projects/presentation/view/project_view.dart';

abstract class AppRouter {
  static const String kHome = '/';
  static const String kProjects = '/projects';
  static final router = GoRouter(
    initialLocation: kHome,
    routes: [
      GoRoute(path: kHome, builder: (context, state) => HomeView()),
      GoRoute(path: kProjects, builder: (context, state) => ProjectsView()),
    ],
  );
}
