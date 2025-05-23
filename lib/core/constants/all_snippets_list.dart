import 'package:flutter/material.dart';
import 'package:portfolio_web/feature/snippets/data/model/snippet_model.dart';

final List<SnippetModel> allSnippets = [
  SnippetModel(
    title: 'Nextjs Starter',
    description: 'Starter boilerplate for Next.js projects.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 12,
    icons: [Icons.code, Icons.web],
  ),
  SnippetModel(
    title: 'Flutter Firebase Auth',
    description: 'Simple auth flow using Firebase and Cubit.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 8,
    icons: [Icons.phone_android, Icons.security],
  ),
  SnippetModel(
    title: 'Flutter Clean Architecture',
    description: 'Base Flutter project with clean architecture.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 6,
    icons: [Icons.flutter_dash, Icons.layers],
  ),
  SnippetModel(
    title: 'Flutter Adaptive Layout',
    description: 'Responsive layout using MediaQuery & LayoutBuilder.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 10,
    icons: [Icons.devices, Icons.view_compact],
  ),
  SnippetModel(
    title: 'Flutter Cubit HTTP Example',
    description: 'API integration using Dio + Cubit pattern.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 5,
    icons: [Icons.api, Icons.send],
  ),
  SnippetModel(
    title: 'Flutter WebSocket Chat',
    description: 'Real-time chat app using WebSocket and Cubit.',
    code: '''
mixin Flyable {
  void fly() {
    print('Flying');
  }
}

class Bird with Flyable {
  void chirp() {
    print('Chirping');
  }
}

void main() {
  Bird bird = Bird();
  bird.fly();
  bird.chirp();
}
''',
    stars: 7,
    icons: [Icons.chat, Icons.web],
  ),
];
