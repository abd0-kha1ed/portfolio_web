import 'package:portfolio_web/feature/home/data/models/project_model.dart';

const List<ProjectModel> allProjects = [
  ProjectModel(
    imagePath: 'assets/images/project1.png',
    type: 'Flutter App',
    title: 'Task Manager',
    description:
        'A productivity app built using Flutter that helps users manage their daily tasks with reminders and analytics.',
  ),
  ProjectModel(
    imagePath: 'assets/images/project2.png',
    type: 'Flutter Web',
    title: 'Portfolio Website',
    description:
        'A personal portfolio website built with Flutter Web, showcasing skills, projects, and contact info with responsive UI.',
  ),
  ProjectModel(
    imagePath: 'assets/images/project3.png',
    type: 'Flutter LMS',
    title: 'Learning Platform',
    description:
        'Flutter LMS built for students and teachers with clean architecture and state management.',
  ),
  ProjectModel(
    imagePath: 'assets/images/project4.png',
    type: 'Flutter Attendance',
    title: 'Attendance System',
    description:
        'QR-based check-in system using Flutter, integrated with Firebase for real-time data sync.',
  ),
];
