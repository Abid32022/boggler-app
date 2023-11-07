import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'date_model.g.dart';

@HiveType(typeId: 2)
class DateModel extends HiveObject {
  @HiveField(0)
  late DateTime date;

  @HiveField(1)
  late int currentIndex;

  DateModel(this.date, this.currentIndex);
}
