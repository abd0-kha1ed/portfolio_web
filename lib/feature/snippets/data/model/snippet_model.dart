import 'package:flutter/material.dart';

class SnippetModel {
  final String title;
  final String description;
  final int stars;
  final List<IconData> icons;
  final String code;

  SnippetModel({
    required this.title,
    required this.description,
    required this.stars,
    required this.icons,
    required this.code,
  });
}
