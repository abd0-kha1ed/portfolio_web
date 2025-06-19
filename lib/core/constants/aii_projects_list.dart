import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/feature/home/data/models/project_model.dart';

const List<ProjectModel> allProjects = [
  ProjectModel(
    url: 'https://github.com/abd0-kha1ed/path_tracker',
    imagePath: Assets.imagesPathTracker,
    type: 'Flutter App',
    title: 'Task Manager',
    description:
        'A productivity app built using Flutter that helps users manage their daily tasks with reminders and analytics.',
  ),
  ProjectModel(
    url: 'https://github.com/abd0-kha1ed/attendance-system',
    imagePath: Assets.imagesLms,
    type: 'Attendance System',
    title: 'Flutter Attendance',
    description:
        'A Flutter-based attendance system that allows teachers to manage student attendance efficiently.',
  ),
  ProjectModel(
    url: 'https://github.com/abd0-kha1ed',
    imagePath: Assets.imagesAttendance,
    type: 'Flutter LMS',
    title: 'Learning Platform',
    description:
        'Flutter LMS built for students and teachers with clean architecture and state management.',
  ),
  ProjectModel(
    url: 'https://github.com/abd0-kha1ed/pharmacy',
    imagePath: Assets.imagesPharmacy,
    type: 'Flutter Pharmacy',
    title: 'Pharmacy Management System',
    description:
        'QR-based check-in system using Flutter, integrated with Firebase for real-time data sync.',
  ),
];
