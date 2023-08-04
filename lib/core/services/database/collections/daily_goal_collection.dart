import "package:isar/isar.dart";

part "daily_goal_collection.g.dart";

@collection
class DailyGoalCollection {
  Id id = Isar.autoIncrement;
  int? count;
  String? dateTime;
}