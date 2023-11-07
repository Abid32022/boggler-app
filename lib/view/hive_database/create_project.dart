import 'package:hive/hive.dart';
part 'create_project.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  int type; // New field to represent the type

  @HiveField(1)
  String projectName;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  int minutes;

  @HiveField(5)
  int totalSeconds;

  Project({
    this.type = 0, // Default type
    this.projectName = "",
    this.title = "null",
    this.description = "null",
    this.minutes = 0,
    required this.totalSeconds,
  });
}
