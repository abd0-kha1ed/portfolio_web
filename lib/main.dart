import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioWebApp());
}

class PortfolioWebApp extends StatelessWidget {
const PortfolioWebApp({ super.key });
@override
Widget build(BuildContext context) {
return MaterialApp.router(
title: 'Abdelrahman | Flutter Developer',
debugShowCheckedModeBanner: false,
theme: ThemeData.dark(),

);
}
}