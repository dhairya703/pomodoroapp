import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
    String id,
    String title,
    String description,
    DateTime deadLineTime,
    DateTime doneTime,
    String category,
    bool done,
  ) : super(
          id: id,
          title: title,
          category: category,
          description: description,
          deadLineTime: deadLineTime,
          doneTime: doneTime,
          done: done,
        );

  factory TaskModel.fromJson(Map item) => TaskModel(
        item["id"],
        item["title"],
        item["description"],
        item["deadLineTime"],
        item["doneTime"],
        item["category"],
        item["done"],
      );

  static toDbQuery(TaskEntity item) => {
        "uid": item.id,
        "title": item.title,
        "description": item.description,
        "category": item.category,
        "deadLineTime": item.deadLineTime.toString(),
        "doneTime": item.doneTime.toString(),
        "done": item.done ? 1 : 0,
      };

  static fromQueryToTaskModel(Map<String, dynamic> item) => TaskEntity(
        id: item["uid"],
        title: item["title"],
        description: item["description"],
        category: item["category"],
        deadLineTime: DateTime.parse(item["deadLineTime"]),
        doneTime: DateTime.parse(item["doneTime"]),
        done: item["done"] == 1 ? true : false,
      );
}
