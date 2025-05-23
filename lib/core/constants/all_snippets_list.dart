import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/snippets/data/model/snippet_model.dart';

final List<SnippetModel> allSnippets = [
  SnippetModel(
    title: 'Nextjs Starter',
    description: 'Starter boilerplate for Next.js projects.',
    stars: 12,
    icons: [Icons.code, Icons.web],
  ),
  SnippetModel(
    title: 'Flutter Firebase Auth',
    description: 'Simple auth flow using Firebase and Cubit.',
    stars: 8,
    icons: [Icons.phone_android, Icons.security],
  ),
  SnippetModel(
    title: 'Flutter Clean Architecture',
    description: 'Base Flutter project with clean architecture.',
    stars: 6,
    icons: [Icons.flutter_dash, Icons.layers],
  ),
  SnippetModel(
    title: 'Flutter Adaptive Layout',
    description: 'Responsive layout using MediaQuery & LayoutBuilder.',
    stars: 10,
    icons: [Icons.devices, Icons.view_compact],
  ),
  SnippetModel(
    title: 'Flutter Cubit HTTP Example',
    description: 'API integration using Dio + Cubit pattern.',
    stars: 5,
    icons: [Icons.api, Icons.send],
  ),
  SnippetModel(
    title: 'Flutter WebSocket Chat',
    description: 'Real-time chat app using WebSocket and Cubit.',
    stars: 7,
    icons: [Icons.chat, Icons.web],
  ),
  ];
