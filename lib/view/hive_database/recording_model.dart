import 'package:hive/hive.dart';
part 'recording_model.g.dart';

@HiveType(typeId: 4)
class YourModel extends HiveObject {
  @HiveField(0)
  String title; // Add a title property
  @HiveField(1)
  int sessionId;
  @HiveField(2)
  DateTime bogglingTimeAndData;
  @HiveField(3)
  String voiceText;
  @HiveField(4)
  String summary;
  @HiveField(5)
  String nextStep;
  @HiveField(6)
  String recommendations;
  @HiveField(7)
  String suggestions;

  YourModel({
    required this.title, // Initialize the title property
    required this.sessionId,
    required this.bogglingTimeAndData,
    required this.voiceText,
    required this.summary,
    required this.nextStep,
    required this.recommendations,
    required this.suggestions,
  });
}
