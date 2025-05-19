import 'package:go_router/go_router.dart';
import 'package:portfolio_web/feature/home/presentation/view/home_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>  HomeView(),
      ),
    ],
  );
}
