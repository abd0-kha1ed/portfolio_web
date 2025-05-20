import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/routing/app_router.dart';

void main() {
  runApp(PortfolioWebApp());
}

class PortfolioWebApp extends StatelessWidget {
  const PortfolioWebApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Abdelrahman | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
