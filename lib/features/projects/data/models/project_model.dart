import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    required super.appName,
    required super.description,
    required super.github,
    required super.logo,
    required super.screens,
    required super.slogan,
    required super.vertical,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      appName: map['appName'] ?? '',
      description: map['description'] ?? '',
      github: map['github'] ?? '',
      logo: map['logo'] ?? '',
      screens: List<String>.from(map['screens'] ?? []),
      slogan: map['slogan'] ?? '',
      vertical: map['vertical'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appName': appName,
      'description': description,
      'github': github,
      'logo': logo,
      'screens': screens,
      'slogan': slogan,
      'vertical': vertical,
    };
  }
}
