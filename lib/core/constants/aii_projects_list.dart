import 'package:portfolio_web/core/utils/assets.dart';
import 'package:portfolio_web/feature/home/data/models/project_model.dart';

const List<ProjectModel> allProjects = [
  ProjectModel(
    url: 'https://github.com/abd0-kha1ed/path_tracker',
    imagePath: Assets.imagesPathTracker,
    type: 'Robot Controller',
    title: 'Path Tracker',
    description:
        'A Flutter-based mobile app that controls a ground-tracking robot. It displays real-time data such as speed, obstacle distance, and robot status, and allows interactive control of movement and path tracking.',
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
    url: 'https://github.com/abd0-kha1ed/lms',
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
