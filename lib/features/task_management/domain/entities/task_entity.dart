import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title, description;
  final DateTime deadLineTime;
  final DateTime? doneTime;
  final bool done;

  const TaskEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.deadLineTime,
      this.doneTime,
      required this.done});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        deadLineTime,
        doneTime,
        done,
      ];
}
