import 'package:hive/hive.dart';

part 'existing_data.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int minutes;

  @HiveField(2)
  int seconds;

  @HiveField(3)
  DateTime startTime;

  @HiveField(4)
  DateTime endTime;

  bool isExpanded;

  @HiveField(5)
  int type;

  DataModel({
    required this.type,
    required this.date,
    required this.minutes,
    required this.seconds,
    required this.startTime,
    required this.endTime,
    this.isExpanded = false,
  });
}
