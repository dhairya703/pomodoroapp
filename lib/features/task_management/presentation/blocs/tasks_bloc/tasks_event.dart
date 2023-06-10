part of "tasks_bloc.dart";

abstract class TasksEvent extends Equatable {
  const TasksEvent();
}

class TaskAdded extends TasksEvent {
  final TaskEntity data;

  const TaskAdded(this.data);

  @override
  List<Object?> get props => [data];

  @override
  String toString() => "Task Added : $data";
}

class CategoryAdded extends TasksEvent {
  final CategoryEntity data;

  const CategoryAdded(this.data);

  @override
  List<Object?> get props => [data];
}

class AllTasksFetched extends TasksEvent {
  const AllTasksFetched();

  @override
  List<Object?> get props => [];
}

class CategoriesFetched extends TasksEvent {
  @override
  List<Object?> get props => [];
}

class TaskCompleted extends TasksEvent {
  final TaskEntity taskEntity;

  const TaskCompleted(this.taskEntity);

  @override
  List<Object?> get props => [taskEntity];

  @override
  String toString() {
    return "TaskCompleted{taskEntity: $taskEntity}";
  }
}

class TaskDeleted extends TasksEvent {
  final String id;

  const TaskDeleted(this.id);

  @override
  List<Object?> get props => [id];
}

class DateAdded extends TasksEvent {
  final DateTime dateTime;

  const DateAdded(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class TaskEdited extends TasksEvent {
  final TaskEntity item;

  const TaskEdited(this.item);

  @override
  List<Object?> get props => [item];

  @override
  String toString() {
    return "TaskEdited{item: $item}";
  }
}

class TasksFiltered extends TasksEvent {
  final TasksFilterEnum filterMode;
  final List<TaskEntity> list;

  const TasksFiltered({
    required this.filterMode,
    required this.list,
  });

  @override
  List<Object?> get props => [
        filterMode,
        list,
      ];
}
